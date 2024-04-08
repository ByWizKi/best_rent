import 'package:best_rent/models/car/car.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class InfoCarPage extends StatelessWidget {
  final Car car;
  const InfoCarPage({super.key, required this.car});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 15, right: 40.0),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
            size: 40,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          car.model!,
          style: AppTextStyles.titleDescriptionTextStyle,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 244,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(
                car.urlImageVehicle!,
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 38,
              crossAxisSpacing: 11.5,
              children: [
                infoWidget("places", car, context),
                infoWidget("Manuelle", car, context),
                infoWidget("sacs", car, context),
                infoWidget("portes", car, context),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget infoWidget(element, car, context) {
  IconData icon;
  switch (element) {
    case "places":
      icon = Icons.airline_seat_recline_extra;
      break;
    case "Manuelle":
      icon = Icons.drive_eta;
      break;
    case "Automatique":
      icon = Icons.drive_eta;
      break;
    case "Sacs":
      icon = Icons.local_shipping;
      break;
    case "Portes":
      icon = Icons.door_sliding;
      break;
    default:
      icon = Icons.door_sliding;
  }
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: AppColors.primaryColor,
      border: Border.all(
        color: AppColors.blackColor,
        width: 2,
      ),
    ),
    child: Column(
      children: [
        Icon(
          icon,
          color: AppColors.blackColor,
          size: 50,
        ),
        Text(
          element,
          style: AppTextStyles.descriptionTextStyle,
        ),
      ],
    ),
  );
}
