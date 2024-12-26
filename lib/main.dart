import 'package:expanse_tracker/app/route.dart';
import 'package:expanse_tracker/app/theme/theme.dart';
import 'package:expanse_tracker/firebase_options.dart';
import 'package:expanse_tracker/pages/auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // initialRoute: AuthGate.routeName,
      // onGenerateRoute: myRoutes,
      initialRoute: SplashScreen.routeName,
      // initialRoute: NavigationMenu.routeName,
      onGenerateRoute: myRoutes,
    );
  }
}
