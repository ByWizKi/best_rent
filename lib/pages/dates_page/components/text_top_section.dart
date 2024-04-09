import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// A [Widget] representing a text section at the top of a screen.
///
/// This widget displays a text with a solid line underneath it.
/// The text is "POUR QUAND ?" and it is styled with the large title text theme.
///
/// The [context] parameter is used to access the current theme.
///
/// Returns a [Container] widget with a decoration containing a bottom border
/// and a child [Text] widget.
Widget textTopSection(BuildContext context) {
  return Container(
    // The decoration of the container defines the border at the bottom.
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          // The border is solid and 4 pixels wide.
          color: AppColors.blackColor2,
          width: 4.0,
          style: BorderStyle.solid,
        ),
      ),
    ),
    // The child of the container is a [Text] widget with the text "POUR QUAND ?".
    child: Text(
      'POUR QUAND ?',
      // The style of the text is the large title text theme of the current theme.
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
