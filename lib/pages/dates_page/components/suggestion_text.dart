import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget textSuggestionSection(context) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    decoration: const BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: AppColors.blackColor2,
              width: 4.0,
              style: BorderStyle.solid)), // Exemple avec une ligne solide
    ),
    child: Text(
      'Pour Aller Plus Vite !',
      style: Theme.of(context).textTheme.titleMedium,
    ),
  );
}
