import 'package:flutter/material.dart';
import 'package:investment_app/router/app_routes.dart';
import 'package:investment_app/theme/app_branding_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double logoWidth = 200;
    const double logoHeight = 200;

    return Scaffold(
      backgroundColor: Theme.of(context).extension<AppBrandingColors>()!.color,
      body: Center(
        child: SizedBox(
          width: logoWidth,
          height: logoHeight,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
