import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class AppSliderContent extends StatelessWidget {
  final String title;
  final String content;

  const AppSliderContent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.white,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.white,
              ),
        ),
      ],
    );
  }
}
