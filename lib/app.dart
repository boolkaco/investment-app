import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/router/app_routes.dart';
import 'package:investment_app/screens/home_screen.dart';
import 'package:investment_app/screens/onboarding_screen.dart';
import 'package:investment_app/screens/splash_screen.dart';
import 'package:investment_app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
      ],
      child: MaterialApp(
        title: 'Investment app',
        theme: AppTheme.lightTheme,
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.onboarding: (context) => const OnboardingScreen(),
        },
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
