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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Ensures alignment if needed
          children: [
            topSection(context),
            Expanded(
              // Wrap SingleChildScrollView with Expanded to use available space only
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    // Example placeholders for list items or additional content
                    feedCars(context, currentCarList),
                    // Uncomment or add other widgets here
                    // listFeedSection(context),
                    // editButton(context),
                    // carWidget(context, currentCarList[0]),
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
