import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays the logo used in the splash screen.
///
/// This widget uses the `SvgPicture.asset` widget to display an SVG image
/// located in the 'assets/images' directory. The image file name is
/// 'logo_splash_screen.svg'. The width and height of the image is 300
/// logical pixels.
Widget logoSplashScreen() {
  return SvgPicture.asset(
    // The path to the SVG image file.
    'assets/images/logo_splash_screen.svg',

    // The width of the image.
    width: 300,

    // The height of the image.
    height: 300,
  );
}
