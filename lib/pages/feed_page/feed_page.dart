import 'package:best_rent/pages/feed_page/components/top_section.dart';
import 'package:best_rent/services/car_request/car_request.dart';
import 'package:best_rent/services/service.dart';
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
          children: [
            topSection(context),
            // listFeedSection(context),
            // editButton(context),

            ElevatedButton(
                onPressed: () async {
                  await searchVehicle(currentUser);
                },
                child: const Text('test')),
          ],
        ),
      ),
    );
  }
}
