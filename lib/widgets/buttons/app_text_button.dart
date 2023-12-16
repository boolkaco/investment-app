import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String label;

  const AppTextButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
