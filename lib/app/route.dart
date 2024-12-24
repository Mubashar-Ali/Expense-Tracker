import 'package:expanse_tracker/core/components/navigation_menu.dart';
import 'package:expanse_tracker/pages/home_screen.dart';
import 'package:expanse_tracker/pages/login_screen.dart';
import 'package:expanse_tracker/pages/onboarding_screen.dart';
import 'package:expanse_tracker/pages/singup_screen.dart';
import 'package:expanse_tracker/pages/splash_screen.dart';
import 'package:flutter/material.dart';

Route? myRoutes(RouteSettings settings) {
  return switch (settings.name) {
    SplashScreen.routeName => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    OnboardingScreen.routeName => MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      ),
    LoginScreen.routeName => MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    SignupScreen.routeName => MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    NavigationMenu.routeName => MaterialPageRoute(
        builder: (context) => const NavigationMenu(),
      ),
    HomeScreen.routeName => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    _ => MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      )
  };
}
