import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColors {
  static const Color beginBackGroundColor = Color.fromRGBO(80, 239, 144, 1.0);
  static const Color middleBackGroundColor = Color.fromRGBO(136, 225, 172, 1.0);
  static const Color endBackGroundColor = Color.fromRGBO(255, 255, 255, 1.0);

  static const LinearGradient gradient = LinearGradient(
    colors: [
      beginBackGroundColor,
      middleBackGroundColor,
      endBackGroundColor,
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Color primaryColor = Color.fromRGBO(80, 239, 144, 1.0);
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color blackColor2 = Color.fromRGBO(62, 62, 62, 1.0);
}
