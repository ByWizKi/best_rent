import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget topSection(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 14.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: AppColors.whiteColor,
    ),
    child: const Row(children: [
      Text("test"),
      Spacer(),
      Text("test2"),
    ]),
  );
}
