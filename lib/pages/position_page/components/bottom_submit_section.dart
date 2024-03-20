import 'dart:developer';

import 'package:best_rent/pages/position_page/components/alert_dialog_confirme_position.dart';
import 'package:best_rent/pages/position_page/components/alert_dialog_error.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget bottomSubmitSection(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.6,
    height: 55,
    child: ElevatedButton(
      onPressed: () {
        // Verify if position is not null
        if (currentUser.cityName == '') {
          log('Position null');
          // Show error dialog
          showDialog(
            context: context,
            builder: (context) => alertDialogPositionError(context),
            barrierDismissible: true,
            useSafeArea: true,
          );
        } else {
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
        backgroundColor: AppColors.blackColor2,
        surfaceTintColor: AppColors.blackColor2,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        'Je Valide !',
        style: AppTextStyles.buttonStyle,
      ),
    ),
  );
}
