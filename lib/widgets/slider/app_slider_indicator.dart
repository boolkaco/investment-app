import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class AppSliderIndicator extends StatelessWidget {
  final bool isActive;

  const AppSliderIndicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: 10,
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.chartreuseYellow
              : AppColors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
