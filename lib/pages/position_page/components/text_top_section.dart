import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget textTopSection(context) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: AppColors.blackColor2,
              width: 4.0,
              style: BorderStyle.solid)), // Exemple avec une ligne solide
    ),
    child: Text(
      'OU ÊTES VOUS ?',
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
