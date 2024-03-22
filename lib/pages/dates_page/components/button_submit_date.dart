import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget buttonSubmitDate(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.6,
    height: 55,
    child: ElevatedButton(
      onPressed: () {},
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
