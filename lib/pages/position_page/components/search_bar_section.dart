import 'dart:developer';

import 'package:best_rent/screens/suggestion_location_screen/suggestion_location_screen.dart';
import 'package:best_rent/services/geo_position/geo_position.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget searchBarSection(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    child: Row(
      children: [
        buttonTextField(context),
        const Spacer(),
        iconButton(context),
      ],
    ),
  );
}

Widget buttonTextField(context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.42,
    height: 66,
    decoration: const BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: TextButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SuggestionLocationScreen())),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
        overlayColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
      ),
      child: Text(
        'SELECTIONNER UNE ZONE',
        style: AppTextStyles.bigButtonStyle,
      ),
    ),
  );
}

Widget iconButton(context) {
  return Container(
    width: 66,
    height: 66,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
        overlayColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
      ),
      color: AppColors.blackColor2,
      onPressed: () async {
        try {
          await updatePosition();
          log('Position updated successfully by current position button');
        } catch (error) {
          log(error.toString());
        }
      },
      icon: const Icon(
        Icons.near_me_outlined,
        size: 40,
      ),
    ),
  );
}
