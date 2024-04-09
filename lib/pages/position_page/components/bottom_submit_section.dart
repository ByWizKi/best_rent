import 'dart:developer';

import 'package:best_rent/pages/position_page/components/alert_dialog_confirme_position.dart';
import 'package:best_rent/pages/position_page/components/alert_dialog_error.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget representing the bottom section of a page, with a submit button.
///
/// This widget is used to display a bottom section of a page, with a submit
/// button. It takes a [BuildContext] as a parameter and returns a
/// [SizedBox] widget.
///
/// The submit button is an [ElevatedButton] with the text 'Je Valide !'.
/// It checks if the current user's position is not null. If it is not null,
/// it shows a dialog with a confirmation message. If it is null, it shows a
/// dialog with an error message.
Widget bottomSubmitSection(BuildContext context) {
  return SizedBox(
    // Set the width and height of the SizedBox
    width: MediaQuery.of(context).size.width / 1.6,
    height: 55,
    child: ElevatedButton(
      // Define the onPressed function
      onPressed: () {
        // Check if the user's position is null
        if (currentUser.cityName == '') {
          // If it is null, show an error dialog
          log('Position null');
          showDialog(
            context: context,
            builder: (context) => alertDialogPositionError(context),
            barrierDismissible: true,
            useSafeArea: true,
          );
        } else {
          // If it is not null, show a confirmation dialog
          log('Position not null : ${currentUser.cityName}');
          showDialog(
            context: context,
            builder: (context) => alertDialogConfirmePosition(context),
            barrierDismissible: true,
            useSafeArea: true,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        // Set the button's style properties
        backgroundColor: AppColors.blackColor2,
        surfaceTintColor: AppColors.blackColor2,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        // Set the text of the button
        'Je Valide !',
        style: AppTextStyles.buttonStyle,
      ),
    ),
  );
}
