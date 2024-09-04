import 'package:flutter/material.dart';

import 'my_color.dart';

class MyTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: AppColors.whiteColor,
        )),
  );
}
