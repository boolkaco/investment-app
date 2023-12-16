import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final Function() callback;
  final String label;

  const AppTextButton({
    super.key,
    required this.label,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: Text(
        label,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.white,
            ),
      ),
    );
  }
}
