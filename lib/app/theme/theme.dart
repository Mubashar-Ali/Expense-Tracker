import 'package:expanse_tracker/app/theme/custom_themes/appbar_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/checkbox_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/chip_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/elevated_button_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/outlined_button_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/text_button.dart';
import 'package:expanse_tracker/app/theme/custom_themes/text_field_theme.dart';
import 'package:expanse_tracker/app/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 231, 241, 248),
      textTheme: MyTextTheme.lightTextTheme,
      chipTheme: MyChipTheme.lightChipTheme,
      appBarTheme: MyAppbarTheme.lightAppBarTheme,
      checkboxTheme: MyCheckBoxTheme.lightCheckBoxTheme,
      bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
      textButtonTheme: MyTextButtonTheme.lightTextButtonTheme,
      tabBarTheme: TabBarTheme(
        indicatorColor: Colors.blue,
        labelColor: Colors.blue,
      ));
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    appBarTheme: MyAppbarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: MyTextButtonTheme.darkTextButtonTheme,
  );
}
