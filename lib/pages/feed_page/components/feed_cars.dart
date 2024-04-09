import 'package:best_rent/pages/feed_page/components/car_widget.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of cars in a scrollable column.
///
/// The [context] parameter is the BuildContext of the parent widget.
/// The [listCars] parameter is the list of cars to be displayed.
///
/// Returns a SingleChildScrollView widget that wraps a Column widget.
Widget feedCars(BuildContext context, List<dynamic> listCars) {
  // If the list of cars is empty, display a message indicating that
  if (listCars.isEmpty) {
    return const Center(
      child: Text(
        'Aucune voiture disponible',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  // Generate a list of CarWidget using the list of cars and return it wrapped in a SingleChildScrollView
  return SingleChildScrollView(
    // Wrap the column with a SingleChildScrollView for potential overflow
    child: Column(
      children: List.generate(
        listCars.length,
        (index) => carWidget(context, listCars[index]),
      ),
    ),
  );
}
