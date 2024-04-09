import 'package:best_rent/pages/feed_page/components/button_edit_research.dart';
import 'package:best_rent/pages/feed_page/components/feed_cars.dart';
import 'package:best_rent/pages/feed_page/components/top_section.dart';
import 'package:best_rent/services/service.dart'; // Ensure that this service is used if necessary, else remove it.
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override

  /// Builds the [FeedPage] widget.
  ///
  /// This method builds a [Scaffold] widget that contains a [Column] with a
  /// [TopSection], a [SingleChildScrollView] containing a [FeedCars] widget, and
  /// a [FloatingActionButton]. The [FeedPage] is styled with a gradient
  /// background and padding on the top.
  ///
  /// The [FeedPage] is stateful and updates its state whenever the list of
  /// current car list changes.
  Widget build(BuildContext context) {
    return Scaffold(
      // Places the [FloatingActionButton] in the center of the screen
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // A [FloatingActionButton] that calls the [buttonEditResearch] function
      // when pressed
      floatingActionButton: buttonEditResearch(context),
      // A container that wraps a column of widgets
      body: Container(
        // Adds padding on the top
        padding: const EdgeInsets.only(top: 70.0),
        // Sets the background gradient
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        // A column of widgets
        child: Column(
          // Ensures alignment if needed
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // A [TopSection] that calls the [topSection] function and updates
            // the state when it is refreshed
            topSection(
                context,
                () => {
                      setState(() {
                        currentCarList = currentCarList;
                      })
                    }),
            // A [SingleChildScrollView] that wraps a [Column] containing a
            // [FeedCars] widget
            Expanded(
              // Wrap SingleChildScrollView with Expanded to use available space
              // only
              child: SingleChildScrollView(
                // Adds padding on the top
                padding: const EdgeInsets.only(top: 20.0),
                // A column of widgets
                child: Column(
                  // A [FeedCars] widget that calls the [feedCars] function and
                  // passes the [context] and [currentCarList]
                  children: [
                    feedCars(context, currentCarList),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
