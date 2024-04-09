import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Styles for text used in the application.
///
/// These styles include various text styles for different purposes such as
/// headings, buttons, suggestions, and more. Each style is a [TextStyle]
/// defined using [GoogleFonts] with a specific color, font size, and
/// font weight.
class AppTextStyles {
  /// Text style for the splash screen text.
  static TextStyle get styleSplashScreenText => GoogleFonts.archivo(
        color: AppColors.blackColor2,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      );

  /// Text style for level 1 headings.
  static TextStyle get heading1 => GoogleFonts.archivo(
        color: AppColors.blackColor2,
        fontSize: 32.0, // Ensure the fontSize is a double for consistency
        fontWeight: FontWeight.w900,
      );

  /// Text style for level 2 headings.
  static TextStyle get heading2 => GoogleFonts.archivo(
        color: AppColors.blackColor2,
        fontSize: 26.0, // Ensure the fontSize is a double for consistency
        fontWeight: FontWeight.w900,
      );

  /// Text style for big buttons.
  static TextStyle get bigButtonStyle => GoogleFonts.archivo(
        color: const Color.fromRGBO(135, 135, 135, 1),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      );

  /// Text style for suggestion buttons.
  static TextStyle get suggestionButtonStyle => GoogleFonts.archivo(
        color: AppColors.blackColor2,
        fontSize: 36,
        fontWeight: FontWeight.w900,
        letterSpacing: 3.0,
      );

  /// Text style for suggestion input.
  static TextStyle get suggestionStyleInput => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  /// Text style for suggestions.
  static TextStyle get suggestionStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 17,
        fontWeight: FontWeight.w700,
        shadows: <Shadow>[
          const Shadow(
            color: Color.fromARGB(30, 0, 0, 0),
            blurRadius: 2.0,
            offset: Offset(0.0, 5.0),
          )
        ],
      );

  /// Text style for buttons.
  static TextStyle get buttonStyle => GoogleFonts.archivo(
        color: AppColors.whiteColor,
        fontSize: 36,
        fontWeight: FontWeight.w900,
        letterSpacing: 3.0,
      );

  /// Text style for alert dialog buttons.
  static TextStyle get buttonAlertDialog => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      );

  /// Text style for alert dialog titles.
  static TextStyle get titleAlertDialog => GoogleFonts.archivo(
        color: AppColors.blackColor2,
        fontSize: 27,
        fontWeight: FontWeight.w700,
      );

  /// Text style for controls text.
  static TextStyle get controlsTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );

  /// Text style for label days text.
  static TextStyle get labelDaysTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );

  /// Text style for days text.
  static TextStyle get daysTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor2,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  /// Text style for selected days text.
  static TextStyle get selectedDaysTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  /// Text style for time picker text.
  static TextStyle get timePickerTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  /// Text style for suggestion date time picker text.
  static TextStyle get suggestionDateTimePickerTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  /// Text style for top feed section text.
  static TextStyle get topFeedSectionTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.whiteColor,
        fontSize: 36,
      );

  /// Text style for rating text.
  static TextStyle get ratingTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor,
        fontSize: 15,
      );

  /// Text style for name model text.
  static TextStyle get nameModelTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor,
        fontSize: 20,
      );

  /// Text style for price text.
  static TextStyle get priceTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor2,
        fontSize: 15,
      );

  /// Text style for edit button text.
  static TextStyle get editButtonTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.whiteColor,
        fontSize: 15,
        letterSpacing: 3.0,
      );

  /// Text style for title description text.
  static TextStyle get titleDescriptionTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor,
        fontSize: 33,
      );

  /// Text style for description text.
  static TextStyle get descriptionTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor,
        fontSize: 14,
      );

  /// Text style for supplier name text.
  static TextStyle get supplierNameTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor,
        fontSize: 24,
      );

  /// Text style for supplier address text.
  static TextStyle get supplierAdressTextStyle => GoogleFonts.archivoBlack(
        color: AppColors.blackColor2,
        fontSize: 12,
      );

  /// Text style for price description text.
  static TextStyle get priceDescriptionTextStyle => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w800,
        fontSize: 30,
      );

  /// Text style for button description text.
  static TextStyle get buttonDescriptionTextStyle2 => GoogleFonts.archivo(
        color: AppColors.blackColor,
        fontSize: 14,
        fontWeight: FontWeight.w800,
      );
}
