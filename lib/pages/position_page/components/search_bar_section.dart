import 'package:best_rent/screens/suggestion_location_screen/suggestion_location_screen.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget searchBarSection(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    child: Row(children: [
      buttonTextField(context),
      const Spacer(),
      iconButton(context)
    ]),
  );
}

Widget buttonTextField(context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.42,
    height: 66,
    decoration: const BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 22,
          color: Color.fromRGBO(0, 0, 0, 0.19),
        ),
        BoxShadow(
          offset: Offset(0, 40),
          blurRadius: 40,
          color: Color.fromRGBO(0, 0, 0, 0.16),
        ),
        BoxShadow(
          offset: Offset(0, 89),
          blurRadius: 53,
          color: Color.fromRGBO(0, 0, 0, 0.10),
        ),
        BoxShadow(
          offset: Offset(0, 158),
          blurRadius: 63,
          color: Color.fromRGBO(0, 0, 0, 0.03),
        ),
      ],
    ),
    child: TextButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SuggestionLocationScreen())),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
        overlayColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
      ),
      child: Text(
        'SELECTIONNER UNE ZONE',
        style: AppTextStyles.bigButtonStyle,
      ),
    ),
  );
}

Widget iconButton(context) {
  return Container(
    width: 66,
    height: 66,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 22,
          color: Color.fromRGBO(0, 0, 0, 0.19),
        ),
        BoxShadow(
          offset: Offset(0, 40),
          blurRadius: 40,
          color: Color.fromRGBO(0, 0, 0, 0.16),
        ),
        BoxShadow(
          offset: Offset(0, 89),
          blurRadius: 53,
          color: Color.fromRGBO(0, 0, 0, 0.10),
        ),
        BoxShadow(
          offset: Offset(0, 158),
          blurRadius: 63,
          color: Color.fromRGBO(0, 0, 0, 0.03),
        ),
      ],
    ),
    child: IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
        overlayColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
      ),
      color: AppColors.blackColor2,
      onPressed: () {
        print("click");
      },
      icon: const Icon(
        Icons.near_me_outlined,
        size: 40,
      ),
    ),
  );
}
