import 'package:expanse_tracker/core/utils/loading_screen.dart';
import 'package:expanse_tracker/services/firebase_auth_services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel {
  //variables
  final FirebaseAuthServices _authService = FirebaseAuthServices();
  User? _currentUser;
  User? get currentUser => _currentUser;

  //methods
  Future<void> signUp(
      String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingScreen(); // Display the loading screen
      },
    );
    try {
      _currentUser = await _authService.signUp(email, password);
    } catch (e) {
      e.toString();
    } finally {
      Navigator.of(context).pop(); // Dismiss the loading screen
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingScreen(); // Display the loading screen
      },
    );
    try {
      _currentUser = await _authService.signIn(email, password);
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss the loading screen
      e.toString();
    } finally {
      Navigator.of(context).pop(); // Dismiss the loading screen
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingScreen(); // Display the loading screen
      },
    );
    try {
      _currentUser = await _authService.signInWithGoogle();
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss the loading screeغ
      e.toString();
    } finally {
      Navigator.of(context).pop(); // Dismiss the loading screen
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _authService.signOut(context);
  }
}
