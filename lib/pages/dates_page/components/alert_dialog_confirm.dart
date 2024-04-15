import 'package:best_rent/pages/feed_page/feed_page.dart';
import 'package:best_rent/services/car_request/car_request.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget alertDialogConfirmDates(BuildContext context) {
  return AlertDialog(
    backgroundColor: AppColors.whiteColor,
    titlePadding:
        const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
    alignment: Alignment.center,
    surfaceTintColor: AppColors.whiteColor,
    title: Text(
      'Vous validez ${DateFormat('dd-MM-yyyy HH:mm').format(currentUser.datePickUp)} et ${DateFormat('dd-MM-yyyy HH:mm').format(currentUser.dateDropOff)} comme dates de location ?',
      textAlign: TextAlign.center,
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
            onPressed: () => Navigator.pop(context),
            child: Text('Non', style: AppTextStyles.buttonAlertDialog),
          ),
          const Spacer(),
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
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevents the dialog from closing on touch outside
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ), // Loading indicator
                  );
                },
              );
              await searchVehicle(currentUser);
              Navigator.pop(context); // Dismiss the loading dialog
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedPage(),
                  ));
            },
            child: Text('Oui', style: AppTextStyles.buttonAlertDialog),
          ),
        ],
      ),
    ],
  );
}
