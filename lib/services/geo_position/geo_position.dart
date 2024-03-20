import 'dart:developer';

import 'package:best_rent/env/env.dart';
import 'package:best_rent/services/service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

// Get user position based on current position
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // debugPrint('Location services are disabled.');
    return Future.error('Location services are disabled.');
  }

  // Permission is denied
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // debugPrint('Location permissions are denied, requesting permissions...');
    // Permission is denied we need to request it
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // debugPrint('Location permissions are denied after request.');
      return Future.error('Location permissions are denied');
    }
  }

  // Permission is denied forever
  if (permission == LocationPermission.deniedForever) {
    // debugPrint('Location permissions are permanently denied, we cannot request permissions.');
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // debugPrint('Location permissions granted, obtaining position...');
  return await Geolocator.getCurrentPosition();
}

// Get user position based on city name
Future<Position> _determinePositionFromCityName(String cityName) async {
  try {
    // debugPrint('Getting position for city name: $cityName');
    final service = GoogleGeocodingApi(
      Env.googleApiKey,
      isLogged: false,
    );

    final response = await service.search(
      cityName,
      language: 'fr',
    );

    if (response.status == 'OK' && response.results.isNotEmpty) {
      debugPrint('Position found for city name: $cityName');
      return Position(
          longitude: response.results.first.geometry!.location.lng,
          latitude: response.results.first.geometry!.location.lat,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0);
    } else {
      debugPrint('No results found for city name: $cityName');
      return Future.error('No results found for city name: $cityName');
    }
  } catch (e) {
    debugPrint('Error in getPositionFromCityName: $e');
    return Future.error('Error in getPositionFromCityName: $e');
  }
}

// Get cityName based on coordinates
Future<String?> getCityNameFromCoordinates(
    double latitude, double longitude) async {
  try {
    // Utiliser le package geocoding pour obtenir les informations de localisation
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    // Retourner le nom de la ville. Assurez-vous que la liste n'est pas vide.
    if (placemarks.isNotEmpty) {
      // debugPrint(placemarks.first.locality ?? "Not found");
      return placemarks.first.locality;
    } else {
      return "Location not available";
    }
  } catch (e) {
    // En cas d'erreur, retourner un message d'erreur.
    return "Failed to get city name: $e";
  }
}

// Update user position based on coordinates
Future<void> updatedPositionFromCoordinates(
    double latitude, double longitude) async {
  try {
    // debugPrint('Updating position from coordinates: $latitude, $longitude');
    if (latitude.isNaN || longitude.isNaN) return;
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
    // debugPrint('Position updated from coordinates: ${currentUser.latitude}, ${currentUser.longitude}');
    currentUser.cityName =
        await getCityNameFromCoordinates(latitude, longitude);
    // debugPrint('Position updated from coordinates: ${currentUser.cityName}');
  } catch (e) {
    log('Error in updatedPositionFromCoordinates: $e');
    debugPrint('Error in updatedPositionFromCoordinates: $e');
  }
}

// Update user position based on city name
Future<void> updatePositionFromCityName(String cityName) async {
  try {
    debugPrint('Updating position from city name: $cityName');
    Position position = await _determinePositionFromCityName(cityName);
    currentUser.position = position;
    // debugPrint('Position updated from city name: ${currentUser.latitude}, ${currentUser.longitude}');
    currentUser.cityName = cityName;
    // debugPrint('Position updated from city name: $cityName');
  } catch (e) {
    log('Error in updatePositionFromCityName: $e');
    // debugPrint('Error in updatePositionFromCityName: $e');
  }
}

// Update user position based on current position
Future<void> updatePosition() async {
  try {
    // debugPrint('Updating user position...');
    currentUser.position = await _determinePosition();
    currentUser.cityName = await getCityNameFromCoordinates(
      double.parse(currentUser.latitude),
      double.parse(currentUser.longitude),
    );
    // debugPrint('Position updated from current position: ${currentUser.latitude}, ${currentUser.longitude}');
    // debugPrint('Position updated from current position: ${currentUser.cityName}');
    // debugPrint('User position updated.');
  } catch (e) {
    // debugPrint('Error in updatePosition: $e');
  }
}
