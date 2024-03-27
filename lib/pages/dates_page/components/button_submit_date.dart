import 'package:best_rent/pages/dates_page/components/alert_dialog_confirm.dart';
import 'package:best_rent/pages/dates_page/components/alert_dialog_error.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget buttonSubmitDate(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.6,
    height: 55,
    child: ElevatedButton(
      onPressed: () {
        if (currentUser.datePickUp.isAfter(currentUser.dateDropOff)) {
          showDialog(
              context: context,
              builder: (context) => alertDialogDatesError(context));
        } else {
          showDialog(
              context: context,
              builder: (context) => alertDialogConfirmDates(context));
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
