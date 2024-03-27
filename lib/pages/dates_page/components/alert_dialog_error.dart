import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget alertDialogDatesError(context) {
  return AlertDialog(
    backgroundColor: AppColors.whiteColor,
    titlePadding:
        const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
    alignment: Alignment.center,
    surfaceTintColor: AppColors.whiteColor,
    title: Text(
      textAlign: TextAlign.center,
      'Veuillez sélectionner des dates valides',
      style: AppTextStyles.titleAlertDialog,
    ),
    actions: [
      Center(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
            fixedSize: const MaterialStatePropertyAll<Size>(Size(200, 50)),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text('Je réessaye', style: AppTextStyles.buttonAlertDialog),
        ),
      )
    ],
  );
}
