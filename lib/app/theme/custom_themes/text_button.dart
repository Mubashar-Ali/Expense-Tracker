import 'package:expanse_tracker/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MyTextButtonTheme {
  MyTextButtonTheme._();
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      // shape: const RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: Colors.grey,
      //   ),
      //   borderRadius: BorderRadius.all(Radius.circular(14)),
      // ),
      foregroundColor: MyColors.primary,
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    ),
  );
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      // shape: const RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: Colors.grey,
      //   ),
      //   borderRadius: BorderRadius.all(Radius.circular(14)),
      // ),
      foregroundColor: MyColors.primary,
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );
}
