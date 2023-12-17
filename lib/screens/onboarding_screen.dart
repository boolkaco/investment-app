import 'package:flutter/material.dart';
import 'package:investment_app/models/slide_model.dart';
import 'package:investment_app/router/app_routes.dart';
import 'package:investment_app/theme/app_branding_colors.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';
import 'package:investment_app/widgets/buttons/app_text_button.dart';
import 'package:investment_app/widgets/slider/app_slider_content.dart';
import 'package:investment_app/widgets/slider/app_slider_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<SlideModel> slides = [
    SlideModel(
      'assets/images/online_shopping.png',
      'Smart Investing',
      'Explore tailored investment strategies that align with your financial goals. Our app demystifies complex market trends, offering easy-to-understand insights and tools. Make informed decisions and grow your wealth with confidence.',
    ),
    SlideModel(
      'assets/images/portable_investment.png',
      'Diverse Portfolio',
      'Elevate your investment game by building a diversified portfolio with stocks, bonds, ETFs, and more. Our app provides expert insights and real-time analytics to help you balance risk and maximize returns, ensuring a healthier financial future.',
    ),
    SlideModel(
      'assets/images/digital_wallet.png',
      'Real-Time Analytics',
      'Gain an edge with up-to-the-minute market data and in-depth analytics. Our app empowers you to make swift, informed investment decisions based on current financial trends, expert forecasts, and personalized recommendations.',
    ),
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
                        slides[activeIndex].image,
                        key: ValueKey<String>(slides[activeIndex].image),
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
                AppSliderContent(
                  title: slides[activeIndex].title,
                  content: slides[activeIndex].content,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      isCustom: true,
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
