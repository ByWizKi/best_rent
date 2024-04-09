import 'package:best_rent/services/service.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';

/// A widget that represents the top section of the feed page.
///
/// It contains a [Container] with a black color, rounded corners and a
/// box shadow. Inside the container, it displays a [shortSection] widget.
///
/// The [topSection] widget takes two parameters:
///  - [context]: the build context of the parent widget.
///  - [onTap]: a callback function that is called when the widget is tapped.
Widget topSection(BuildContext context, Function()? onTap) {
  return Container(
    // Margin and padding for the container.
    margin: const EdgeInsets.symmetric(horizontal: 20.0),
    padding: const EdgeInsets.only(left: 10),

    // Decoration of the container.
    decoration: BoxDecoration(
      color: AppColors.blackColor2, // Color of the container.
      borderRadius:
          BorderRadius.circular(10.0), // Border radius of the container.
      boxShadow: [
        BoxShadow(
          color:
              AppColors.blackColor.withOpacity(0.3), // Color of the box shadow.
          spreadRadius: 2, // Spread radius of the box shadow.
          blurRadius: 3, // Blur radius of the box shadow.
          offset: const Offset(0, 3), // Offset of the box shadow.
        )
      ],
    ),

    // Child of the container, which is a [shortSection] widget.
    child: shortSection(context, onTap),
  );
}

Widget shortSection(BuildContext context, Function()? onTap) {
  return InkWell(
    onTap: () async {
      String sortChoice = "";
      await SelectDialog.showModal<String>(
        context,
        showSearchBox: false,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.2,
          minHeight: MediaQuery.of(context).size.height * 0.2,
        ),
        backgroundColor: AppColors.primaryColor,
        titleStyle: AppTextStyles.heading2,
        label: "Filtre",
        items: [
          "Prix croissant",
          "Prix décroissant",
          "Mieux notés",
        ],
        onChange: (String selected) => sortChoice = selected,
      );
      switch (sortChoice) {
        case "Prix croissant":
          sortByPriceLowToHigh(currentCarList);
          onTap!();
          break;
        case "Prix décroissant":
          sortByPriceHighToLow(currentCarList);
          onTap!();
          break;
        case "Mieux notés":
          sortByRating(currentCarList);
          onTap!();
          break;
        default:
          break;
      }
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.filter_list, color: AppColors.primaryColor, size: 50),
        const SizedBox(width: 65.0),
        Text("Filtre", style: AppTextStyles.topFeedSectionTextStyle),
      ],
    ),
  );
}
