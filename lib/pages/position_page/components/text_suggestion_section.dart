import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// Widget for the suggestion section in the position page.
///
/// This widget displays a section with a suggestion text and a divider.
///
/// The [context] parameter is required and represents the BuildContext of the widget.
Widget textSuggestionSection(BuildContext context) {
  return Container(
    // Margin at the bottom of the container
    margin: const EdgeInsets.only(bottom: 20.0),
    // Decoration of the container, with a bottom border
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: AppColors.blackColor2, // Color of the border
            width: 4.0, // Width of the border
            style: BorderStyle.solid), // Style of the border
      ),
    ),
    // Child of the container, a Text widget
    child: Text(
      'Pour Aller Plus Vite !', // Text displayed
      style: Theme.of(context).textTheme.titleMedium, // Style of the text
    ),
  );
}
