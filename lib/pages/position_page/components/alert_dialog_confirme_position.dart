import 'package:best_rent/pages/dates_page/dates_pages.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget alertDialogConfirmePosition(context) {
  return AlertDialog(
    backgroundColor: AppColors.whiteColor,
    titlePadding:
        const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
    alignment: Alignment.center,
    surfaceTintColor: AppColors.whiteColor,
    title: Text(
      textAlign: TextAlign.center,
      'Vous validez ${currentUser.cityName} comme ville ?',
      style: AppTextStyles.titleAlertDialog,
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll<Size>(Size(90, 40)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ))),
            onPressed: () async {
              // If no, go back
              Navigator.pop(context);
            },
            child: Text(
              'Non',
              style: AppTextStyles.buttonAlertDialog,
            ),
          ),
          const Spacer(),
          // Yes button
          ElevatedButton(
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll<Size>(Size(90, 40)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ))),
            onPressed: () async {
              // If yes, go to dates page
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
