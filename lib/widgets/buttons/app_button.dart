import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;

  const AppButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
