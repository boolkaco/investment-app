import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/favorite/favorite_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/bloc/profile/profile_bloc.dart';
import 'package:investment_app/router/app_routes.dart';
import 'package:investment_app/screens/home_screen.dart';
import 'package:investment_app/screens/onboarding_screen.dart';
import 'package:investment_app/screens/splash_screen.dart';
import 'package:investment_app/utils/theme_notifier.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<FavoriteBloc>(create: (context) => FavoriteBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Investment app',
                theme: themeNotifier.currentTheme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routes: {
                  AppRoutes.home: (context) => const HomeScreen(),
                  AppRoutes.splash: (context) => const SplashScreen(),
                  AppRoutes.onboarding: (context) => const OnboardingScreen(),
                },
                initialRoute: AppRoutes.splash,
              );
            },
          );
        },
      ),
    );
  }
}
