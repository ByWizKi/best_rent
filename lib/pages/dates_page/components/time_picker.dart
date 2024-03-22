import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget timePicker(context, text) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Column(
      children: [
        Text(
          text,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTime(context),
            const SizedBox(width: 10.0),
            inputTime(context),
          ],
        )
      ],
    ),
  );
}

Widget inputTime(context) {
  return Container(
    width: MediaQuery.of(context).size.width / 6,
    height: 40,
    decoration: const BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
          color: AppColors.blackColor2,
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        )
      ],
    ),
    child: const TextField(
      decoration: InputDecoration(counterText: ""),
      maxLength: 2,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.number,
    ),
  );
}
