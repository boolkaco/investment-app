import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/profile/profile_bloc.dart';
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
      tr('smart_investing'),
      tr('smart_investing_desc'),
    ),
    SlideModel(
      'assets/images/portable_investment.png',
      tr('portfolio'),
      tr('portfolio_desc'),
    ),
    SlideModel(
      'assets/images/digital_wallet.png',
      tr('analytics'),
      tr('analytics_desc'),
    ),
  ];

  int activeIndex = 0;

  onClick() {
    if (activeIndex == 2) {
      ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
      profileBloc.updateData();
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
            label: tr('skip'),
            callback: () {
              ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
              profileBloc.updateData();
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
                      maxWidth: 340,
                      maxHeight: 340,
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
                      label: activeIndex == 2 ? tr('letsgo') : tr('next'),
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
