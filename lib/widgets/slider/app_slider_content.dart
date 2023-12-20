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
    var screenSize = MediaQuery.of(context).size;

    var textStyle = (screenSize.width < 400)
        ? Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.white,
              fontSize: 14,
            )
        : Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.white,
            );

    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.white,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: textStyle,
        ),
      ],
    );
  }
}
