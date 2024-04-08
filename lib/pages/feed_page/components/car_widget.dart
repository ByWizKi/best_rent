import 'package:best_rent/models/car/car.dart';
import 'package:best_rent/pages/feed_page/components/info_car_page.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

// Consider passing a specific Car type instead of dynamic for type safety.
Widget carWidget(BuildContext context, dynamic car) {
  return Card(
    elevation:
        4, // Added elevation to lift the card slightly, integrating the shadow effect
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Uniformly rounded corners
      side: const BorderSide(
        color: AppColors.blackColor,
        width: 2.0,
      ),
    ),
    child: ClipRRect(
      // Added to apply borderRadius to the image within the card
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 12.6),
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 4.2,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 6, // Increased blur radius for a smoother shadow
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(children: [
          ratingsImageSection(context, car),
          bottomSection(context, car),
        ]),
      ),
    ),
  );
}

Widget ratingsImageSection(BuildContext context, Car car) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(5.0),
          width: 56,
          height: 32,
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.blackColor,
                size: 18,
              ),
              Text(
                car.ratings.toString(),
                style: AppTextStyles.ratingTextStyle,
              ),
            ],
          ),
        ),
        const Spacer(),
        Image.network(
          car.urlImageVehicle!,
          height: 120,
          width: 231.2,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error,
                color: Colors.red); // Handle image load failures
          },
        ),
      ],
    ),
  );
}

Widget bottomSection(BuildContext context, Car car) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              car.model!,
              style: AppTextStyles.nameModelTextStyle,
            ),
            Text(
              "Prix : ${car.price!}€",
              style: AppTextStyles.priceTextStyle,
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor:
                const MaterialStatePropertyAll<Color>(AppColors.primaryColor),
            surfaceTintColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor),
            elevation: MaterialStateProperty.all<double>(3),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InfoCarPage(car: car),
            ));
          },
          child: const Icon(
            Icons.arrow_circle_right,
            color: AppColors.blackColor,
            size: 30,
          ),
        ),
      ],
    ),
  );
}
