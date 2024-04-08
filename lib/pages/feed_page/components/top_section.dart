import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:list_picker/list_picker.dart';

Widget topSection(context) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 14.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: AppColors.whiteColor,
    ),
    child: Row(
      children: [
        shortSection(context),
        const Spacer(),
        modelsSection(context),
      ],
    ),
  );
}

Widget shortSection(context) {
  return Container(
    padding: const EdgeInsets.only(top: 7.0, bottom: 9.0),
    width: MediaQuery.of(context).size.width / 2.80,
    height: MediaQuery.of(context).size.height / 21.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: AppColors.blackColor2,
      boxShadow: [
        BoxShadow(
          color: AppColors.blackColor.withOpacity(0.3), // Color of the shadow
          spreadRadius: 1, // Spread radius
          blurRadius: 2, // Blur radius
          offset: const Offset(0, 3), // changes position of shadow
        )
      ],
    ),
    child: GestureDetector(
      onTap: () async {
        String? shortChoice = await showPickerDialog(
          context: context,
          label: "Trier par :",
          items: const [
            "Prix croissant",
            "Prix décroissant",
            "Mieux notés",
          ],
        );
        switch (shortChoice) {
          case "Prix croissant":
            sortByPriceLowToHigh(currentCarList);
            break;
          case "Prix décroissant":
            sortByPriceHighToLow(currentCarList);
            break;
          case "Mieux notés":
            sortByRating(currentCarList);
            break;
          default:
            break;
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.swap_vert, color: AppColors.primaryColor),
          const SizedBox(width: 15.0),
          Text("Trier par :", style: AppTextStyles.topFeedSectionTextStyle),
        ],
      ),
    ),
  );
}

Widget modelsSection(context) {
  return Container(
    padding: const EdgeInsets.only(top: 7.0, bottom: 9.0),
    width: MediaQuery.of(context).size.width / 2.80,
    height: MediaQuery.of(context).size.height / 21.3,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.blackColor2,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.3), // Color of the shadow
            spreadRadius: 1, // Spread radius
            blurRadius: 2, // Blur radius
            offset: const Offset(0, 3), // changes position of shadow
          )
        ]),
    child: GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.directions_car, color: AppColors.primaryColor),
          const SizedBox(width: 15.0),
          Text("Modèles", style: AppTextStyles.topFeedSectionTextStyle),
        ],
      ),
    ),
  );
}
