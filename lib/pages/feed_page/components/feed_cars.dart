import 'package:best_rent/pages/feed_page/components/car_widget.dart';
import 'package:flutter/material.dart';

Widget feedCars(BuildContext context, List<dynamic> listCars) {
  if (listCars.isEmpty) {
    return const Center(
      child:
          Text('Aucune voiture disponible', style: TextStyle(fontSize: 16.0)),
    );
  }
  return SingleChildScrollView(
    // Wrap the column with a SingleChildScrollView for potential overflow
    child: Column(
      children: List.generate(
          listCars.length, (index) => carWidget(context, listCars[index])),
    ),
  );
}
