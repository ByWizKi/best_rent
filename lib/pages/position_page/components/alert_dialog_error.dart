import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Returns an AlertDialog widget that is used to display an error message to
/// the user when they haven't selected a city.
///
/// The [context] parameter is the BuildContext of the widget that is calling
/// this function.
///
/// The function takes the [BuildContext] of the widget that is calling it
/// and uses it to display an AlertDialog. The AlertDialog has a white background
/// color, a centered title, and a centered button. The title is "Veuillez
/// sélectionner une ville" (Please select a city) and the button is labeled
/// "Je réessaye" (I'll try again). When the button is pressed, the dialog is
/// dismissed.
Widget alertDialogPositionError(BuildContext context) {
  return AlertDialog(
    // Set the background color of the AlertDialog to white
    backgroundColor: AppColors.whiteColor,
    // Add padding to the top, left, and right of the AlertDialog
    titlePadding: const EdgeInsets.only(
      top: 20,
      left: 10,
      right: 10,
      bottom: 20,
    ),
    // Center the title and content of the AlertDialog
    alignment: Alignment.center,
    // Set the tint color of the AlertDialog's surface to white
    surfaceTintColor: AppColors.whiteColor,
    // Set the title of the AlertDialog to "Veuillez sélectionner une ville"
    title: Text(
      textAlign: TextAlign.center,
      'Veuillez sélectionner une ville',
      style: AppTextStyles.titleAlertDialog,
    ),
    // Add a button to the AlertDialog
    actions: [
      Center(
        // Create an ElevatedButton
        child: ElevatedButton(
          style: ButtonStyle(
            // Set the shape of the button to be rounded
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            // Set the size of the button to be fixed
            fixedSize: const MaterialStatePropertyAll<Size>(Size(200, 50)),
            // Set the background color of the button to the primary color
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor),
          ),
          // Add an onPressed callback that dismisses the AlertDialog
          onPressed: () => Navigator.pop(context),
          // Set the label of the button to "Je réessaye"
          child: Text(
            'Je réessaye',
            style: AppTextStyles.buttonAlertDialog,
          ),
        ),
      ),
    ],
  );
}
