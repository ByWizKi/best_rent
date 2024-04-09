import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// A [Widget] representing a top section with a text.
///
/// This widget is typically used to display a title at the top of a screen.
///
/// The [context] parameter is required to access the current theme.
///
/// The function returns a [Container] with a decoration that includes a
/// bottom border and a [Text] widget displaying the title.
Widget textTopSection(BuildContext context) {
  return Container(
    // Decoration of the container
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          // Add a bottom border
          color: AppColors.blackColor2, // Color of the border
          width: 4.0, // Width of the border
          style: BorderStyle.solid, // Style of the border
        ),
      ),
    ),
    child: Text(
      'OU ÊTES VOUS ?', // Text to display
      style: Theme.of(context).textTheme.titleLarge, // Style of the text
    ),
  );
}
