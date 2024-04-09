import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// A [Container] widget that displays a section with a suggestion text.
///
/// This widget has a top and bottom margin of 20.0 and a decoration with a
/// bottom border of 4.0 pixels solid black. The text is styled with the
/// [titleMedium] text theme from the current [Theme].
///
/// The [context] parameter is used to access the current [Theme].
Widget textSuggestionSection(BuildContext context) {
  return Container(
    // Set the top and bottom margin
    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    // Set the decoration
    decoration: const BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: AppColors.blackColor2,
              width: 4.0,
              style: BorderStyle.solid)), // Example with a solid line
    ),
    // Set the text
    child: Text(
      'Pour Aller Plus Vite !',
      style: Theme.of(context).textTheme.titleMedium,
    ),
  );
}
