import 'package:best_rent/pages/position_page/position_page.dart';
import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Returns a widget that represents a button for editing the search.
///
/// The button is an [ElevatedButton] that, when pressed, clears the current
/// list of cars and navigates to the [PositionPage].
///
/// The button has a fixed size of 215x50 logical pixels, a rounded rectangle
/// border with a radius of 10, and a background color of [AppColors.blackColor2].
///
/// The [onPressed] callback is set to clear the current list of cars and
/// navigate to the [PositionPage].
///
/// The button's child is a [Text] widget with the text 'Modifier la recherche'
/// and the style [AppTextStyles.editButtonTextStyle].
Widget buttonEditResearch(BuildContext context) {
  return ElevatedButton(
    // Button style
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
      fixedSize: const MaterialStatePropertyAll<Size>(Size(215, 50)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackColor2),
    ),

    // Button onPressed callback
    onPressed: () {
      currentCarList.clear(); // Clear current list of cars
      Navigator.push(
        // Navigate to PositionPage
        context,
        MaterialPageRoute(builder: (context) => const PositionPage()),
      );
    },

    // Button child
    child: Text(
      'Modifier la recherche',
      style: AppTextStyles.editButtonTextStyle,
      textAlign: TextAlign.center,
    ),
  );
}
