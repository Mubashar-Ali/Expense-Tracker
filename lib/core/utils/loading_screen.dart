import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: SpinKitSpinningLines(
          color: Colors.black, // You can customize this to match your app theme
          size: 50.0,
        ),
      ),
    );
  }
}

class MyHelperFunctions {}
