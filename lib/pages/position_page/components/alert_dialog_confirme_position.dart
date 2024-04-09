import 'package:best_rent/pages/dates_page/dates_pages.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Creates an AlertDialog to confirm the user's city.
///
/// The AlertDialog displays a title asking if the user wants to validate
/// their current city as the city selected. The user can choose to confirm
/// the city or go back to the previous page.
///
/// The AlertDialog has two buttons: 'Non' (for no) and 'Oui' (for yes).
///
/// Parameters:
/// - `context`: The BuildContext where the AlertDialog is displayed.
///
/// Returns: An AlertDialog widget.
Widget alertDialogConfirmePosition(BuildContext context) {
  return AlertDialog(
    // Set the background color to white.
    backgroundColor: AppColors.whiteColor,
    // Set the padding for the title.
    titlePadding: const EdgeInsets.only(
      top: 20,
      left: 10,
      right: 10,
      bottom: 20,
    ),
    // Set the alignment of the dialog to center.
    alignment: Alignment.center,
    // Set the surface tint color to white.
    surfaceTintColor: AppColors.whiteColor,
    // Set the title of the dialog.
    title: Text(
      'Vous validez ${currentUser.cityName} comme ville ?',
      style: AppTextStyles.titleAlertDialog,
      textAlign: TextAlign.center,
    ),
    // Set the actions of the dialog.
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Create the 'Non' button.
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll<Size>(Size(90, 40)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            onPressed: () async {
              // If 'Non' is pressed, go back to the previous page.
              Navigator.pop(context);
            },
            child: Text(
              'Non',
              style: AppTextStyles.buttonAlertDialog,
            ),
          ),
          const Spacer(),
          // Create the 'Oui' button.
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll<Size>(Size(90, 40)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            onPressed: () async {
              // If 'Oui' is pressed, go to the DatesPage.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DatesPage();
                  },
                ),
              );
            },
            child: Text(
              'Oui',
              style: AppTextStyles.buttonAlertDialog,
            ),
          ),
        ],
      ),
    ],
  );
}
