import 'package:best_rent/models/car/car.dart';
import 'package:best_rent/pages/feed_page/components/info_car_page.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget to display car details in a Card format.
///
/// The [carWidget] function takes a [BuildContext] and a [Car] object as
/// parameters and returns a Card widget. It displays the details of a car
/// in a card format.
Widget carWidget(BuildContext context, Car car) {
  return Card(
    // Set the margin of the Card to 20.0 on all sides.
    margin: const EdgeInsets.all(20.0),

    // Set the elevation of the Card to 5.
    elevation: 5,

    // Set the shape of the Card to RoundedRectangleBorder with a border radius
    // of 10.0 and a border side of width 3.0 and color AppColors.blackColor.
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(
        color: AppColors.blackColor,
        width: 3.0,
      ),
    ),

    // Set the child of the Card to a ClipRRect widget.
    child: ClipRRect(
      // Set the border radius of the ClipRRect widget to 10.0.
      borderRadius: BorderRadius.circular(10.0),

      // Set the child of the ClipRRect widget to a Container widget.
      child: Container(
        // Set the padding of the Container widget to 10.0 on all sides.
        padding: const EdgeInsets.all(10.0),

        // Set the decoration of the Container widget to a BoxDecoration with a
        // color of AppColors.whiteColor and a box shadow with a color of
        // AppColors.blackColor.withOpacity(0.3), a spread radius of 1, a blur
        // radius of 6, and an offset of (0, 3).
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        // Set the child of the Container widget to a Column widget containing
        // the ratingsImageSection and the bottomSection.
        child: Column(children: [
          ratingsImageSection(context, car),
          bottomSection(context, car),
        ]),
      ),
    ),
  );
}

Widget ratingsImageSection(BuildContext context, Car car) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5.0),
        width: 56, // Consider using a percentage of screen width if needed
        height: 32, // Consider using a percentage of screen height if needed
        child: Row(
          children: [
            const Icon(Icons.star, color: AppColors.blackColor, size: 18),
            Text(car.ratings.toString(), style: AppTextStyles.ratingTextStyle),
          ],
        ),
      ),
      const Spacer(),
      Image.network(
        car.urlImageVehicle!,
        height: MediaQuery.of(context).size.width *
            0.33, // Responsive height based on screen width
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.error, color: Colors.red),
      ),
    ],
  );
}

/// Represents the bottom section of a [Car] widget.
///
/// The [bottomSection] function takes a [BuildContext] and a [Car] object
/// as arguments and returns a [Widget].
///
/// The [bottomSection] function is responsible for displaying the bottom
/// section of a [Car] widget. It includes the model, price, and an
/// [ElevatedButton] that navigates to the [InfoCarPage] when pressed.
/// The UI is constructed using various widgets such as [Container],
/// [Row], [Column], [Text], and [ElevatedButton].
Widget bottomSection(BuildContext context, Car car) {
  return Container(
    // Padding for the bottom section
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      // Children of the Row widget
      children: [
        // Expanded widget for the column
        Expanded(
          child: Column(
            // Cross axis alignment for the column
            crossAxisAlignment: CrossAxisAlignment.start,
            // Main axis alignment for the column
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text widget to display the model of the car
              Text(
                car.model!,
                // Overflow for the Text widget
                overflow: TextOverflow.ellipsis,
                // Style for the Text widget
                style: AppTextStyles.nameModelTextStyle,
              ),
              // Text widget to display the price of the car
              Text(
                "Prix : ${car.price!.toStringAsFixed(2)}€",
                // Style for the Text widget
                style: AppTextStyles.priceTextStyle,
              ),
            ],
          ),
        ),
        // ElevatedButton widget for the navigation button
        ElevatedButton(
          // Style for the ElevatedButton widget
          style: ButtonStyle(
            // Shape property for the ElevatedButton widget
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // Background color property for the ElevatedButton widget
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            // Surface tint color property for the ElevatedButton widget
            surfaceTintColor: MaterialStateProperty.all(AppColors.primaryColor),
            // Elevation property for the ElevatedButton widget
            elevation: MaterialStateProperty.all(3),
          ),
          // Callback function for the onPressed event of the ElevatedButton widget
          onPressed: () {
            // Navigation using Navigator.push
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => InfoCarPage(car: car)));
          },
          // Child widget for the ElevatedButton widget
          child: const Icon(Icons.arrow_circle_right,
              color: AppColors.blackColor, size: 30),
        ),
      ],
    ),
  );
}
