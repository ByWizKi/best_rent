import 'dart:developer';

import 'package:best_rent/services/date_picker/date_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget suggestionDateSection(context, text) {
  return ElevatedButton(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(4),
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        fixedSize: MaterialStateProperty.all<Size>(const Size(90, 40)),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ))),
    onPressed: () async {
      // Debug print
      log(text);
      if (text == '1 Jour') {
        await updateDateByDays(1);
      } else if (text == '2 Jours') {
        await updateDateByDays(2);
      } else if (text == '1 Semaine') {
        await updateDateByDays(7);
      }
    },
    child: Text(
      text,
      style: AppTextStyles.suggestionDateTimePickerTextStyle,
    ),
  );
}