import 'package:addict_tool/ui/onboarding/pages/login_page.dart';
import 'package:addict_tool/ui/onboarding/pages/signup_page.dart';
import 'package:flutter/material.dart';

import 'onboarding/pages/onboarding_pageview.dart';
import 'onboarding/pages/splash_screen.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String splashScreen = 'splashScreen';
  static const String onboardingScreen = 'onboardingPageView';
  static const String signUpPage = 'signUpPage';
  static const String loginPage = 'loginPage';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingPageView(),
    signUpPage: (_) => const SignUpPage(),
    loginPage: (_) => const LoginPage()
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      default:
        return MaterialPageRoute(
          builder: (context) => errorView(settings.name),
        );
    }
  }

  static Widget errorView(String? name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
