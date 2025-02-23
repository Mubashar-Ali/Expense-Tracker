import 'dart:async';

import 'package:expanse_tracker/core/components/navigation_menu.dart';
import 'package:expanse_tracker/pages/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreenServices {
  static void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    Timer(const Duration(seconds: 3), () {
      if (auth.currentUser == null) {
        Navigator.pushReplacementNamed(
          context,
          LoginScreen.routeName,
        );
      } else {
        Navigator.pushReplacementNamed(context, NavigationMenu.routeName);
      }
    });
  }
}
