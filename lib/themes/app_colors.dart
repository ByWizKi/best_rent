import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Contains the different colors used in the app.
///
/// This class groups together the different colors used in the app.
/// Each color is defined with a static constant. Each constant is
/// documented with its corresponding RGB values and opacity.
class AppColors {
  /// The background color at the beginning of the gradient.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color beginBackGroundColor = Color.fromRGBO(80, 239, 144, 1.0);

  /// The background color in the middle of the gradient.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color middleBackGroundColor = Color.fromRGBO(136, 225, 172, 1.0);

  /// The background color at the end of the gradient.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color endBackGroundColor = Color.fromRGBO(255, 255, 255, 1.0);

  /// The linear gradient used in the background.
  ///
  /// This gradient is defined with three colors: [beginBackGroundColor],
  /// [middleBackGroundColor] and [endBackGroundColor]. The stops of the
  /// gradient are set to 0.0, 0.5 and 1.0 respectively. The alignment of the
  /// gradient is set to [Alignment.topCenter] and [Alignment.bottomCenter].
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

  /// The primary color of the app.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color primaryColor = Color.fromRGBO(80, 239, 144, 1.0);

  /// The secondary color of the app.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color secondaryColor = Color.fromRGBO(136, 225, 172, 1.0);

  /// A semi-transparent version of the [secondaryColor].
  ///
  /// This color is defined with an opacity of 0.6.
  static const Color secondaryColorBis = Color.fromRGBO(136, 225, 172, 0.6);

  /// The color representing black.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1.0);

  /// The color representing white.
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1.0);

  /// A darker version of [blackColor].
  ///
  /// This color is defined with an opacity of 1.0.
  static const Color blackColor2 = Color.fromRGBO(62, 62, 62, 1.0);
}
