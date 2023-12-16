import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_branding_colors.dart';
import 'package:investment_app/theme/app_colors.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';
import 'package:investment_app/widgets/buttons/app_text_button.dart';
import 'package:investment_app/widgets/slider/app_slider_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).extension<AppBrandingColors>()!.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            Theme.of(context).extension<AppBrandingColors>()!.color,
        actions: const [
          AppTextButton(label: 'Skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55, right: 21, left: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 360,
                      maxHeight: 360,
                    ),
                    child: Image.asset('assets/images/online_shopping.png'),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSliderIndicator(
                      isActive: true,
                    ),
                    SizedBox(width: 8),
                    AppSliderIndicator(),
                    SizedBox(width: 8),
                    AppSliderIndicator(),
                  ],
                ),
                const SizedBox(height: 27),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.white,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat ',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 66),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(label: 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
