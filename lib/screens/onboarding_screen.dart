import 'package:flutter/material.dart';
import 'package:investment_app/router/app_routes.dart';
import 'package:investment_app/theme/app_branding_colors.dart';
import 'package:investment_app/theme/app_colors.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';
import 'package:investment_app/widgets/buttons/app_text_button.dart';
import 'package:investment_app/widgets/slider/app_slider_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const List<String> images = [
    'assets/images/online_shopping.png',
    'assets/images/portable_investment.png',
    'assets/images/digital_wallet.png',
  ];

  int activeIndex = 0;

  onClick() {
    if (activeIndex == 2) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      setState(() {
        activeIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).extension<AppBrandingColors>()!.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            Theme.of(context).extension<AppBrandingColors>()!.color,
        actions: [
          AppTextButton(
            label: 'Skip',
            callback: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
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
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Image.asset(
                        images[activeIndex],
                        key: ValueKey<String>(images[activeIndex]),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSliderIndicator(
                      isActive: activeIndex == 0,
                    ),
                    const SizedBox(width: 8),
                    AppSliderIndicator(
                      isActive: activeIndex == 1,
                    ),
                    const SizedBox(width: 8),
                    AppSliderIndicator(
                      isActive: activeIndex == 2,
                    ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: activeIndex == 2 ? 'Let\'s go' : 'Next',
                      callback: onClick,
                    ),
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
