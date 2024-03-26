import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle styleSplashScreenText = GoogleFonts.archivo(
    color: AppColors.blackColor2,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading1 = GoogleFonts.archivo(
    color: AppColors.blackColor2,
    fontSize: 32.0, // Ensure the fontSize is a double for consistency
    fontWeight: FontWeight.w900,
  );

  static final TextStyle heading2 = GoogleFonts.archivo(
    color: AppColors.blackColor2,
    fontSize: 26.0, // Ensure the fontSize is a double for consistency
    fontWeight: FontWeight.w900,
  );

  static final TextStyle bigButtonStyle = GoogleFonts.archivo(
    color: const Color.fromRGBO(135, 135, 135, 1),
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle suggestionButtonStyle = GoogleFonts.archivo(
    color: AppColors.blackColor2,
    fontSize: 36,
    fontWeight: FontWeight.w900,
    letterSpacing: 3.0,
  );

  static final TextStyle suggestionStyleInput = GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle suggestionStyle = GoogleFonts.archivo(
      color: AppColors.blackColor,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      shadows: <Shadow>[
        const Shadow(
          color: Color.fromARGB(30, 0, 0, 0),
          blurRadius: 2.0,
          offset: Offset(0.0, 5.0),
        )
      ]);

  static final TextStyle buttonStyle = GoogleFonts.archivo(
    color: AppColors.whiteColor,
    fontSize: 36,
    fontWeight: FontWeight.w900,
    letterSpacing: 3.0,
  );

  static final TextStyle buttonAlertDialog = GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleAlertDialog = GoogleFonts.archivo(
      color: AppColors.blackColor2, fontSize: 27, fontWeight: FontWeight.w700);

  static final TextStyle controlsTextStyle = GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static final TextStyle labelDaysTextStyle = GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle daysTextStyle = GoogleFonts.archivo(
    color: AppColors.blackColor2,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final selectedDaysTextStyle = GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle timePickerTextStyle = GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle suggestionDateTimePickerTextStyle =
      GoogleFonts.archivo(
    color: AppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
