import 'dart:developer';

import 'package:best_rent/services/geo_position/geo_position.dart';
// import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget that displays a list of city suggestion sections.
///
/// The [context] parameter is used to access the size of the screen.
///
/// This widget returns a [Container] with the width of the screen and a
/// bottom margin of 20.0. Inside the [Container], it displays a [Column]
/// with 5 city suggestion sections. Each suggestion section is created
/// by calling the [citySuggestionSection] function with a different city name.
Widget listSuggestionSection(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(bottom: 20.0),
    child: Column(
      children: [
        // Display a city suggestion section for 'Paris'
        citySuggestionSection(context, 'Paris'),
        // Display a city suggestion section for 'Lyon'
        citySuggestionSection(context, 'Lyon'),
        // Display a city suggestion section for 'Marseille'
        citySuggestionSection(context, 'Marseille'),
        // Display a city suggestion section for 'Londres'
        citySuggestionSection(context, 'Londres'),
        // Display a city suggestion section for 'Genève'
        citySuggestionSection(context, 'Genève'),
      ],
    ),
  );
}

/// Widget that displays a single city suggestion section.
///
/// The [context] parameter is used to access the size of the screen.
/// The [city] parameter is the name of the city to suggest.
///
/// This widget returns a [Container] with padding at the bottom and a
/// width equal to the screen width. Inside the [Container], it displays an
/// [ElevatedButton]. The button has a white background color, no surface
/// tint color, 10 elevation, and rounded corners. The button's child is a
/// [Text] widget with the [city] name and a style defined in
/// [AppTextStyles.suggestionButtonStyle]. When the button is pressed, it
/// updates the current user's position using the [updatePositionFromCityName]
/// function. If the position update is successful, it logs a success message.
/// If the update fails, it logs an error message.
Widget citySuggestionSection(BuildContext context, String city) {
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
          // Log success message
          log('Position updated successfully by city name : $city');
        } catch (error) {
          // Log error message
          log('Position not updated by city name : $city \n $error');
        }
      },
    ),
  );
}
