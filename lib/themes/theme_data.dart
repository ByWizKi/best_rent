import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: GoogleFonts.archivo().fontFamily,
      textTheme: TextTheme(
        labelLarge: AppTextStyles.styleSplashScreenText,
      ));
}
