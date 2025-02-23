import 'package:expanse_tracker/pages/auth/login_screen.dart';
import 'package:expanse_tracker/pages/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  static const String routeName = "Auth_Gate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomeScreen();
          }

          // user is NOT logged in
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
