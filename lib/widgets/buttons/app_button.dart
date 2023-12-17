import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final Function() callback;
  final String label;
  final bool isCustom;
  final bool isPrimary;

  const AppButton({
    super.key,
    required this.label,
    required this.callback,
    this.isCustom = false,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (!isPrimary) {
              return Colors.transparent;
            }
            return Theme.of(context)
                .elevatedButtonTheme
                .style!
                .backgroundColor
                ?.resolve(states);
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
            if (!isPrimary) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide(
                  color: AppColors.silver,
                  width: 1,
                ),
              );
            }
            return Theme.of(context)
                    .elevatedButtonTheme
                    .style!
                    .shape
                    ?.resolve(states) ??
                const RoundedRectangleBorder();
          },
        ),
      ),
      child: Text(
        isCustom ? label.toUpperCase() : label,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: isPrimary ? AppColors.white : AppColors.shamrock,
          fontWeight: isCustom ? FontWeight.w400 : FontWeight.w500,
        ),
      ),
    );
  }
}
