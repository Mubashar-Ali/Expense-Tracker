import 'package:expanse_tracker/app/route.dart';
import 'package:expanse_tracker/app/theme/theme.dart';
import 'package:expanse_tracker/core/components/navigation_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: AppTheme.lightTheme,
      // initialRoute: SplashScreen.routeName,
      initialRoute: NavigationMenu.routeName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: myRoutes,
    );
  }
}
