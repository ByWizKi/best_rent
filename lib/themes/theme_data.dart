import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Returns the ThemeData for the entire app.
///
/// This theme data includes the primary color, font family, and text theme.
/// The primary color is defined in `app_colors.dart`.
/// The font family is defined in `app_text_styles.dart`.
/// The text theme includes three styles:
/// - `labelLarge`: Used for large labels.
/// - `titleLarge`: Used for large titles.
/// - `titleMedium`: Used for medium titles.
///
/// All of these styles are defined in `app_text_styles.dart`.
ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: GoogleFonts.archivo().fontFamily,
      textTheme: TextTheme(
        labelLarge: AppTextStyles.styleSplashScreenText,
        titleLarge: AppTextStyles.heading1,
        titleMedium: AppTextStyles.heading2,
      ));
}
