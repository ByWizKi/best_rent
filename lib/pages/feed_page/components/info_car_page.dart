import 'package:best_rent/models/car/car.dart';
import 'package:best_rent/services/car_request/car_request.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoCarPage extends StatelessWidget {
  final Car car;
  const InfoCarPage({super.key, required this.car});

  @override

  /// Builds the UI for the info page of a car.
  ///
  /// This function builds the UI for the info page of a car. It
  /// includes an [AppBar] with a leading arrow button to navigate
  /// back to the previous page, a title with the car's model, and
  /// a [Container] widget that contains the car's image, info grid,
  /// supplier description, and price description.
  ///
  /// The [BuildContext] parameter [context] is used to navigate
  /// back to the previous page. The [Car] parameter [car] is used
  /// to retrieve the car's information.
  Widget build(BuildContext context) {
    // Build the UI for the info page of a car.
    return Scaffold(
      // Build the app bar with a leading arrow button to navigate
      // back to the previous page and a title with the car's model.
      appBar: AppBar(
        leading: IconButton(
          // Navigate back to the previous page when the arrow button is pressed.
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.blackColor, size: 40),
        ),
        backgroundColor: AppColors.primaryColor,
        // Display the car's model as the title of the app bar.
        title: Text(car.model!, style: AppTextStyles.titleDescriptionTextStyle),
      ),
      // Build a container widget that contains the car's image,
      // info grid, supplier description, and price description.
      body: Container(
        // Add padding to the container widget.
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        // Set the width of the container widget to infinity.
        width: double.infinity,
        // Set the height of the container widget to infinity.
        height: double.infinity,
        // Apply a gradient to the container widget.
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        // Build a column widget that contains the car's image,
        // info grid, supplier description, and price description.
        child: Column(
          children: [
            // Build the car's image section.
            carImageSection(car),
            // Build the info grid.
            infoGrid(context, car),
            // Build the supplier description.
            supplierDescription(car),
            // Build the price description.
            priceDescription(car),
          ],
        ),
      ),
    );
  }

  /// Widget that represents the car's image section.
  ///
  /// This widget displays the car's image using an [Image.network] widget
  /// wrapped in a [Transform] widget to rotate it 180 degrees.
  /// It also applies a border radius, a border, and a box shadow to give
  /// the widget a decorative appearance.
  Widget carImageSection(Car car) {
    return Container(
      width: 353,
      // Define the decoration of the container widget.
      decoration: BoxDecoration(
        // Apply a border radius to give the container widget rounded corners.
        borderRadius: BorderRadius.circular(10.0),
        // Set the background color of the container widget to white.
        color: AppColors.whiteColor,
        // Apply a border to the container widget with a black color and width of 3.
        border: Border.all(color: AppColors.blackColor, width: 3),
        // Apply a box shadow to give the container widget a decorative effect.
        boxShadow: [
          BoxShadow(
            // Set the color of the box shadow to black with 0.3 opacity.
            color: AppColors.blackColor.withOpacity(0.3),
            // Set the spread radius of the box shadow to 1.
            spreadRadius: 1,
            // Set the blur radius of the box shadow to 6.
            blurRadius: 6,
            // Set the offset of the box shadow to (0, 5).
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // Build a transform widget to rotate the image 180 degrees.
      child: Transform(
        // Define the angle of rotation as 3.14 (180 degrees).
        transform: Matrix4.rotationY(3.14),
        // Align the image to the center of the container widget.
        alignment: Alignment.center,
        // Build an image widget to display the car's image.
        child: Image.network(
          // Set the URL of the car's image.
          car.urlImageVehicle!,
          // Set the fit of the image to cover to ensure it covers the entire container widget.
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget infoGrid(BuildContext context, Car car) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 1.2,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          infoWidget("Places", Icons.airline_seat_recline_extra,
              "${car.seats} places"),
          infoWidget("Transmission", FontAwesomeIcons.gear,
              car.isAutomatic! ? "Auto" : "Manuelle"),
          infoWidget("Sacs", FontAwesomeIcons.suitcase, "${car.baggage} sacs"),
          infoWidget("Portes", Icons.toys, "${car.doors} portes"),
        ],
      ),
    );
  }

  Widget infoWidget(String title, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primaryColor,
        border: Border.all(color: AppColors.blackColor, width: 3),
        boxShadow: [
          BoxShadow(
              color: AppColors.blackColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.blackColor, size: 50),
          Text(text, style: AppTextStyles.descriptionTextStyle),
        ],
      ),
    );
  }

  Widget supplierDescription(Car car) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        border: Border.all(color: AppColors.blackColor, width: 3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 58,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColors.blackColor, width: 3),
              image: DecorationImage(
                image: NetworkImage(car.urlImageSupplier!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        car.nameSupplier!,
                        style: AppTextStyles.supplierNameTextStyle,
                        softWrap: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.star,
                              color: AppColors.blackColor, size: 18),
                          Text(car.ratings.toString(),
                              style: AppTextStyles.ratingTextStyle),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    car.adresseSupplier!,
                    softWrap: true,
                    style: AppTextStyles.supplierAdressTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget priceDescription(Car car) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
      child: Row(
        children: [
          Text("Prix : ${car.price!.toStringAsFixed(2)}€",
              style: AppTextStyles.priceDescriptionTextStyle),
          const Spacer(),
          ElevatedButton(
            onPressed: () =>
                openCarDealUrl(car.idVehicle!.toString(), car.searchKey!),
            style: ElevatedButton.styleFrom(
                elevation: 4,
                fixedSize: const Size(130, 50),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: AppColors.blackColor, width: 2),
                ),
                backgroundColor: AppColors.secondaryColor),
            child: Row(
              children: [
                Text(
                  "Reserver\nMaintenant",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.buttonDescriptionTextStyle2,
                ),
                const Spacer(),
                const Icon(
                  FontAwesomeIcons.arrowRight,
                  color: AppColors.blackColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
