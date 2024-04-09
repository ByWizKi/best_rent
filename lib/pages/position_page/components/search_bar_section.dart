import 'dart:developer';

import 'package:best_rent/screens/suggestion_location_screen/suggestion_location_screen.dart';
import 'package:best_rent/services/geo_position/geo_position.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget that represents the section of the screen with the search bar.
///
/// This widget displays a container with a text field and an icon button.
///
/// Parameters:
///   - [context]: The build context of the widget tree.
///
/// Returns: A container widget with the search bar.
Widget searchBarSection(BuildContext context) {
  return Container(
    // Set the width of the container to match the width of the screen.
    width: MediaQuery.of(context).size.width,

    // Set the vertical margin of the container to 20.
    margin: const EdgeInsets.symmetric(vertical: 20.0),

    // Set the children of the container to a row with two widgets:
    //  - A text field.
    //  - A spacer.
    //  - An icon button.
    child: Row(
      children: [
        // Display a text field.
        buttonTextField(context),

        // Add a spacer to fill the remaining space in the row.
        const Spacer(),

        // Display an icon button.
        iconButton(context),
      ],
    ),
  );
}

/// Widget that represents a text field with a button style.
///
/// This widget displays a container with a text field and a text button.
/// The text button triggers a navigation to [SuggestionLocationScreen].
///
/// Parameters:
///   - [context]: The build context of the widget tree.
///
/// Returns: A container widget with a text field and a button.
Widget buttonTextField(BuildContext context) {
  return Container(
    // Set the width of the container to 4/5 of the screen width.
    width: MediaQuery.of(context).size.width / 1.42,

    // Set the height of the container to 66.
    height: 66,

    // Set the decoration of the container.
    decoration: const BoxDecoration(
      // Set the color of the container to [AppColors.whiteColor].
      color: AppColors.whiteColor,

      // Set the border radius of the container to 20.
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),

    // Set the child of the container to a text button.
    child: TextButton(
      // Set the onPressed callback of the button.
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SuggestionLocationScreen())),

      // Set the style of the button.
      style: ButtonStyle(
        // Set the background color of the button to [AppColors.whiteColor].
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),

        // Set the overlay color of the button to [AppColors.whiteColor].
        overlayColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
      ),

      // Set the child of the button to a text widget.
      child: Text(
        // Set the text of the button to 'SÉLECTIONNER UNE ZONE'.
        'SÉLECTIONNER UNE ZONE',

        // Set the style of the text to [AppTextStyles.bigButtonStyle].
        style: AppTextStyles.bigButtonStyle,
      ),
    ),
  );
}

/// Widget that represents an icon button with a 'Near Me' icon.
///
/// This widget displays a container with an icon button.
/// The icon button updates the user's current position when pressed.
///
/// Parameters:
///   - None
///
/// Returns: A container widget with an icon button.
Widget iconButton(context) {
  return Container(
    // Set the width and height of the container to 66.
    width: 66,
    height: 66,

    // Set the decoration of the container.
    decoration: const BoxDecoration(
      // Set the color of the container to white.
      color: Colors.white,

      // Set the border radius of the container to 20.
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),

    // Set the child of the container to an icon button.
    child: IconButton(
      // Set the style of the button.
      style: ButtonStyle(
        // Set the background color of the button to white.
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),

        // Set the overlay color of the button to white.
        // overlayColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
      ),

      // Set the color of the icon to blackColor2.
      color: AppColors.blackColor2,

      // Set the onPressed callback of the button.
      onPressed: () async {
        try {
          // Update the user's current position.
          await updatePosition();

          // Log a success message.
          log('Position updated successfully by current position button');
        } catch (error) {
          // Log any error that occurs.
          log(error.toString());
        }
      },

      // Set the child of the button to an icon.
      icon: const Icon(
        Icons.near_me_outlined,
        size: 40,
      ),
    ),
  );
}
