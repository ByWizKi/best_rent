import 'dart:developer';

import 'package:best_rent/services/date_picker/date_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget for displaying suggestion dates in a section.
///
/// [context]: Build context of the widget.
/// [text]: Text to be displayed on the button.
///
/// This widget returns an [ElevatedButton] that displays the provided
/// [text] and updates the date based on the text when pressed.
Widget suggestionDateSection(BuildContext context, String text) {
  return ElevatedButton(
    // Style of the button
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(4), // Elevation when pressed
      backgroundColor:
          MaterialStateProperty.all(AppColors.primaryColor), // Background color
      fixedSize:
          MaterialStateProperty.all<Size>(const Size(90, 40)), // Fixed size
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Border radius
        ),
      ),
    ),
    // Function to be executed when the button is pressed
    onPressed: () async {
      // Debug print
      log(text);
      // Update date based on the text
      if (text == '1 Jour') {
        await updateDateByDays(1);
      } else if (text == '2 Jours') {
        await updateDateByDays(2);
      } else if (text == '1 Semaine') {
        await updateDateByDays(7);
      }
    },
    // Text to be displayed on the button
    child: Text(
      text,
      style: AppTextStyles.suggestionDateTimePickerTextStyle,
    ),
  );
}
