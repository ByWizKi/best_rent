import 'dart:developer';

import 'package:best_rent/services/geo_position/geo_position.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget listSuggestionSection(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(bottom: 20.0),
    child: Column(
      children: [
        citySuggestionSection(context, 'Paris'),
        citySuggestionSection(context, 'Lyon'),
        citySuggestionSection(context, 'Marseille'),
        citySuggestionSection(context, 'Londres'),
        citySuggestionSection(context, 'Genève'),
      ],
    ),
  );
}

Widget citySuggestionSection(context, city) {
  return Container(
    padding: const EdgeInsets.only(bottom: 30.0),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        city,
        style: AppTextStyles.suggestionButtonStyle,
      ),
      onPressed: () async {
        try {
          await updatePositionFromCityName(city);
          // debugPrint('Position updated successfully by city name : $city');
          // debugPrint(currentUser.position.toString());
        } catch (error) {
          log('Position not updated by city name : $city \n $error');
          // debugPrint('debugPrint : Position not updated by city name : $city');
        }
      },
    ),
  );
}
