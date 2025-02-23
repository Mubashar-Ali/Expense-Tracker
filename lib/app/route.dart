import 'package:expanse_tracker/core/components/navigation_menu.dart';
import 'package:expanse_tracker/pages/auth/otp_screen.dart';
import 'package:expanse_tracker/pages/auth/verify_phone_number_screen.dart';
import 'package:expanse_tracker/pages/home/add_budget.dart';
import 'package:expanse_tracker/pages/home/add_goal.dart';
import 'package:expanse_tracker/pages/home/add_transaction.dart';
import 'package:expanse_tracker/pages/home/all_goals.dart';
import 'package:expanse_tracker/pages/home/home_screen.dart';
import 'package:expanse_tracker/pages/auth/login_screen.dart';
import 'package:expanse_tracker/pages/auth/onboarding_screen.dart';
import 'package:expanse_tracker/pages/auth/singup_screen.dart';
import 'package:expanse_tracker/pages/auth/splash_screen.dart';
import 'package:expanse_tracker/pages/home/transactions_screen.dart';
import 'package:expanse_tracker/pages/profile/edit_profile_screen.dart';
import 'package:expanse_tracker/pages/survey/survery_screen.dart';
import 'package:expanse_tracker/pages/wallet/add_bank_account_screen.dart';
import 'package:expanse_tracker/pages/wallet/cash_wallet_screen.dart';
import 'package:expanse_tracker/services/firebase_auth_services/auth_gate.dart';
import 'package:flutter/material.dart';

Route? myRoutes(RouteSettings settings) {
  return switch (settings.name) {
    SplashScreen.routeName => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    AuthGate.routeName => MaterialPageRoute(
        builder: (context) => const AuthGate(),
      ),
    OnboardingScreen.routeName => MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      ),
    AddBudget.routeName => MaterialPageRoute(
        builder: (context) => const AddBudget(),
      ),
    AddTransactionScreen.routeName => MaterialPageRoute(
        builder: (context) => const AddTransactionScreen(),
      ),
    VerifyPhoneNumberScreen.routeName => MaterialPageRoute(
        builder: (context) => VerifyPhoneNumberScreen(),
      ),
    AllGoals.routeName => MaterialPageRoute(
        builder: (context) => AllGoals(),
      ),
    TransactionsScreen.routeName => MaterialPageRoute(
        builder: (context) => TransactionsScreen(),
      ),
    AddGoal.routeName => MaterialPageRoute(
        builder: (context) => AddGoal(),
      ),
    CashWalletScreen.routeName => MaterialPageRoute(
        builder: (context) => CashWalletScreen(),
      ),
    EditProfileScreen.routeName => MaterialPageRoute(
        builder: (context) => EditProfileScreen(),
      ),
    LinkBankAccountScreen.routeName => MaterialPageRoute(
        builder: (context) => LinkBankAccountScreen(),
      ),
    SurveyFlow.routeName => MaterialPageRoute(
        builder: (context) => SurveyFlow(),
      ),
    OTPScreen.routeName => MaterialPageRoute(
        builder: (context) => OTPScreen(),
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
