import 'dart:developer';

import 'package:best_rent/env/env.dart';
import 'package:best_rent/services/service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

// Get user position based on current position

/// Retrieves the current position of the user using the Geolocator package.
///
/// This function first checks if location services are enabled. If not, it
/// returns a `Future` that completes with an error message.
///
/// Then, it checks the permission status. If the permission is denied, it
/// requests the permission and retries. If the permission is permanently
/// denied, it returns an error.
///
/// If the permission is granted, it returns the current position of the user.
///
/// Returns a `Future` that completes with a [Position] object representing
/// the user's current location, or an error `Future` if something went wrong.
Future<Position> _determinePosition() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // If not, return an error
    return Future.error('Location services are disabled.');
  }

  // Check the permission status
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // If denied, request the permission and retry
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // If still denied, return an error
      return Future.error('Location permissions are denied');
    }
  }

  // If the permission is permanently denied, return an error
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // If the permission is granted, return the current position
  // debugPrint('Location permissions granted, obtaining position...');
  return await Geolocator.getCurrentPosition();
}

// Get user position based on city name
/// Retrieves the current position of the user based on the provided city name
/// using the Google Geocoding API.
///
/// The function takes a [cityName] as input, searches for the location using
/// the API, and returns a [Position] object representing the user's
/// current location. If no results are found or an error occurs, it returns a
/// `Future` that completes with an error message.
///
/// Parameters:
/// - [cityName]: The name of the city for which to retrieve the position.
///
/// Returns:
/// - A [Future] that completes with a [Position] object representing the
/// user's current location, or a [Future] that completes with an error message
/// if something went wrong.
Future<Position> _determinePositionFromCityName(String cityName) async {
  try {
    // Get the position for the provided city name using the Google Geocoding API
    final service = GoogleGeocodingApi(
      Env.googleApiKey, // API key for accessing the Google Geocoding API
      isLogged: false, // Set to false since we are not logged in
    );

    // Search for the location using the API
    final response = await service.search(
      cityName,
      language: 'fr', // Language of the results (French in this case)
    );

    // Check if the request was successful and if a result was found
    if (response.status.name == 'ok' && response.results.isNotEmpty) {
      // Retrieve the position from the first result
      final result = response.results.first;
      final position = result.geometry!.location;
      return Position(
        longitude: position.lng,
        latitude: position.lat,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    } else {
      // Return an error if no results were found
      return Future.error('No results found for city name: $cityName');
    }
  } catch (e) {
    // Return an error if an error occurred
    return Future.error('Error in getPositionFromCityName: $e');
  }
}

// Get cityName based on coordinates

/// Retrieves the city name based on the provided coordinates using the geocoding package.
///
/// The function takes the latitude and longitude as input, searches for the location using
/// the geocoding package, and returns the name of the city. If no results are found or an error occurs,
/// it returns a `Future` that completes with a message indicating the error.
///
/// Parameters:
/// - [latitude]: The latitude coordinate of the location.
/// - [longitude]: The longitude coordinate of the location.
///
/// Returns:
/// - A `Future` that completes with the name of the city if a result is found,
/// or a `Future` that completes with a message indicating the error if something went wrong.
Future<String?> getCityNameFromCoordinates(
    double latitude, double longitude) async {
  try {
    // Use the geocoding package to get the location information
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    // Return the name of the city if a result is found. Ensure the list is not empty.
    if (placemarks.isNotEmpty) {
      // debugPrint(placemarks.first.locality ?? "Not found");
      return placemarks.first.locality;
    } else {
      // Return a message indicating that the location is not available.
      return "Location not available";
    }
  } catch (e) {
    // Return a message indicating that an error occurred while retrieving the city name.
    return "Failed to get city name: $e";
  }
}

/// Updates the user's position based on the provided coordinates.
///
/// This function takes the latitude and longitude as input and updates the
/// user's position with the provided coordinates. If the coordinates are
/// not valid (NaN), the function returns early. Otherwise, it updates the
/// user's position with the provided coordinates and retrieves the city name
/// using the `getCityNameFromCoordinates` function. If an error occurs during
/// the process, it logs and prints the error.
///
/// Parameters:
/// - [latitude]: The latitude coordinate of the location.
/// - [longitude]: The longitude coordinate of the location.
///
/// Returns:
/// - Nothing.
Future<void> updatedPositionFromCoordinates(
    double latitude, double longitude) async {
  try {
    // Check if the coordinates are valid
    if (latitude.isNaN || longitude.isNaN) return;

    // Update the user's position with the provided coordinates
    currentUser.position = Position(
      longitude: longitude,
      latitude: latitude,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0,
    );

    // Retrieve the city name based on the provided coordinates
    currentUser.cityName =
        await getCityNameFromCoordinates(latitude, longitude);
  } catch (e) {
    // Log and print the error if anything went wrong
    log('Error in updatedPositionFromCoordinates: $e');
    debugPrint('Error in updatedPositionFromCoordinates: $e');
  }
}

// Update user position based on city name
Future<void> updatePositionFromCityName(String cityName) async {
  /// Update user position based on the provided city name.
  ///
  /// This function takes the city name as input and updates the user's
  /// position with the determined coordinates based on the city name.
  /// If an error occurs during the process, it logs and prints the error.
  ///
  /// Parameters:
  /// - [cityName]: The name of the city for which to retrieve the position.
  ///
  /// Returns:
  /// Nothing.
  try {
    // Log the start of the process
    // debugPrint('Updating position from city name: $cityName');

    // Determine the position from the city name
    Position position = await _determinePositionFromCityName(cityName);

    // Update the user's position with the determined coordinates
    currentUser.position = position;

    // Log the success of the process
    // debugPrint('Position updated from city name: ${currentUser.latitude}, ${currentUser.longitude}');

    // Update the city name
    currentUser.cityName = cityName;

    // Log the success of the process
    // debugPrint('Position updated from city name: $cityName');
  } catch (e) {
    // Log and print the error if anything went wrong
    log('Error in updatePositionFromCityName: $e');
    // debugPrint('Error in updatePositionFromCityName: $e');
  }
}
// Update user position based on current position

/// Update the user's position based on their current position.
///
/// This function retrieves the user's current position and updates their
/// position and city name accordingly. If any error occurs during the
/// process, it logs and prints the error.
///
/// Returns:
/// Nothing.
Future<void> updatePosition() async {
  try {
    // Retrieve the user's current position
    currentUser.position = await _determinePosition();

    // Retrieve the city name based on the current position
    currentUser.cityName = await getCityNameFromCoordinates(
      double.parse(currentUser.latitude),
      double.parse(currentUser.longitude),
    );
  } catch (e) {
    // Log and print any error that occurred during the process
    log('Error in updatePosition: $e');
  }
}
