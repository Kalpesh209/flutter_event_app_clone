import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final TextStyle lightText = GoogleFonts.nunito(
    textStyle: const TextStyle(
      color: AppColors.blackTextColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: AppColors.backgroundColor,
    ),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(toolbarTextStyle: lightText),
    textTheme: TextTheme(
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelLarge: lightText,
      bodySmall: lightText,
      labelSmall: lightText,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    navigationBarTheme: const NavigationBarThemeData(
      // indicatorColor: AppColors.backgroundColor,
      indicatorColor: AppColors.whiteColor,
    ),
  );
}
