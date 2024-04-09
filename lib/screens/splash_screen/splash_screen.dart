import 'package:best_rent/pages/position_page/position_page.dart';
import 'package:best_rent/screens/splash_screen/components/logo_components.dart';
import 'package:best_rent/screens/splash_screen/components/text_component.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// The SplashScreen is the first screen the user sees when they open the app.
/// It displays a logo and a text which fade in and scale in respectively.
/// When the animations are done, it navigates to the [PositionPage].
class SplashScreen extends StatefulWidget {
  /// The constructor for the SplashScreen.
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.6, 0.7, curve: Curves.elasticOut),
      ),
    );

    _animationController?.forward();

    // Add a listener to the animation status
    _animationController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to a new page here
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const PositionPage()));
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation!,
              child: logoSplashScreen(),
            ),
            ScaleTransition(
              scale: _scaleAnimation!,
              child: textSplashScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}
