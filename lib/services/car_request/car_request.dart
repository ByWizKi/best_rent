import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:best_rent/env/env.dart';
import 'package:best_rent/models/car/car.dart';
import 'package:best_rent/models/user/user.dart';
import 'package:best_rent/services/service.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// Fetches rental locations based on the provided [user].
///
/// The function makes a GET request to the specified URL with the required
/// headers and query parameters. If the response status code is 200, it
/// attempts to parse the response body as a JSON list and returns the
/// result of [_parseLocationData]. If the parsing fails, it logs the
/// respective error. If any other error occurs, it logs a general error
/// message. If all of the above fails, it returns an empty list.
///
/// The [user] parameter specifies the user object containing the city name.
///
/// Returns a `Future` of type `List<double>`.
Future<List<double>> fetchRentalLocations(User user) async {
  // Define the API endpoint URL
  const String url =
      'https://booking-com.p.rapidapi.com/v1/car-rental/locations';

  // Define the request headers
  final headers = {
    'X-RapidAPI-Key': Env.rapidApiKey,
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };

  // Define the query parameters
  final params = {'locale': 'fr', 'name': user.cityName};

  // Create the URI with the query parameters
  final uri = Uri.parse(url).replace(queryParameters: params);

  try {
    // Make the GET request to the API
    final response = await http.get(uri, headers: headers);

    // If the response status code is 200
    if (response.statusCode == 200) {
      // Parse the response body as JSON and return the result of _parseLocationData
      final data = jsonDecode(response.body) as List<dynamic>;
      return _parseLocationData(data);
    } else {
      // Throw an HttpException with the response status code
      throw HttpException(
          'Failed to fetch locations with status: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Log the error occurred during JSON parsing
    log('Error parsing JSON data: $e');
  } on HttpException catch (e) {
    // Log the error occurred during the API request
    log(e.message);
  } catch (e) {
    // Log a general error occurred
    log('General error occurred: $e');
  }

  // Return an empty list if any of the above fails
  return [];
}

List<double> _parseLocationData(List<dynamic> data) {
  if (data.isNotEmpty) {
    final latitude = double.tryParse(data[0]['latitude']?.toString() ?? '');
    final longitude = double.tryParse(data[0]['longitude']?.toString() ?? '');
    if (latitude != null && longitude != null) {
      return [latitude, longitude];
    } else {
      log('Invalid latitude or longitude values');
    }
  } else {
    log('No data available');
  }
  return [];
}

/// Search for vehicles based on the provided [user]'s location.
///
/// This function first fetches the location data using [fetchRentalLocations].
/// If the length of the fetched location data is less than 2, it throws an
/// exception. Otherwise, it calls [_searchForVehicles] with the fetched
/// location data and the provided [user]. If any error occurs during the
/// process, it logs the error message.
///
/// The [user] parameter specifies the user object containing the location
/// data.
///
/// This function does not return any value.
Future<void> searchVehicle(User user) async {
  try {
    // Fetch location data for the user
    List<double> rentalLocations = await fetchRentalLocations(user);

    // If location data is incomplete, throw an exception
    if (rentalLocations.length < 2) {
      throw Exception('Incomplete location data.');
    }

    // Search for vehicles based on the location data
    await _searchForVehicles(rentalLocations, user);
  } catch (e) {
    // Log any error occurred during the vehicle search
    log('Error searching vehicles: $e');
  }
}

Future<void> _searchForVehicles(List<double> locations, User user) async {
  /// This function makes a GET request to the Booking.com Car Rental Search API
  /// with the provided [locations] and [user] data, and handles the search results.
  ///
  /// The request is made to the following URL:
  /// https://booking-com.p.rapidapi.com/v1/car-rental/search
  ///
  /// The request includes the following headers:
  /// - X-RapidAPI-Key: The RapidAPI key from the environment variables.
  /// - X-RapidAPI-Host: The RapidAPI host from the environment variables.
  ///
  /// The request includes the following query parameters:
  /// - locale: The language locale, set to 'fr'.
  /// - drop_off_longitude: The longitude of the drop-off location.
  /// - pick_up_longitude: The longitude of the pick-up location.
  /// - currency: The currency, set to 'EUR'.
  /// - pick_up_datetime: The date and time of the pick-up.
  /// - drop_off_latitude: The latitude of the drop-off location.
  /// - pick_up_latitude: The latitude of the pick-up location.
  /// - from_country: The country of origin, set to 'fr'.
  /// - sort_by: The sorting method, set to 'recommended'.
  /// - drop_off_datetime: The date and time of the drop-off.
  ///
  /// If the response status code is 200, the function calls [_handleSearchResults]
  /// with the parsed JSON data. If the status code is not 200, it throws an HttpException.
  Future<void> searchForVehicles(List<double> locations, User user) async {
    // Define the API endpoint URL
    const String url =
        'https://booking-com.p.rapidapi.com/v1/car-rental/search';

    // Define the request headers
    final headers = {
      'X-RapidAPI-Key': Env.rapidApiKey,
      'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
    };

    // Define the query parameters
    final params = {
      'locale': 'fr',
      'drop_off_longitude': locations[1].toString(),
      'pick_up_longitude': locations[1].toString(),
      'currency': 'EUR',
      'pick_up_datetime': user.datePickUpString,
      'drop_off_latitude': locations[0].toString(),
      'pick_up_latitude': locations[0].toString(),
      'from_country': 'fr',
      'sort_by': 'recommended',
      'drop_off_datetime': user.dateDropOffString
    };

    // Create the URI with the query parameters
    final uri = Uri.parse(url).replace(queryParameters: params);

    // Make the GET request to the API
    final response = await http.get(uri, headers: headers);

    // Handle the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      _handleSearchResults(data);
    } else {
      throw HttpException(
          'Failed to fetch vehicles with status: ${response.statusCode}');
    }
  }
}

/// Parses the search results received from the API and adds the vehicles to
/// the [currentCarList].
///
/// The [data] parameter contains the response data from the API.
void _handleSearchResults(Map<String, dynamic> data) {
  // Check if the search results are present in the data
  if (data['search_results'] is List) {
    // Iterate over each vehicle in the search results
    for (var vehicleJson in data['search_results']) {
      // Create a [Car] object from the JSON data
      Car car = Car.fromJson(vehicleJson);

      // Assign the search key to the car object
      car.searchKey = data['search_key'];

      // Add the car object to the current car list
      currentCarList.add(car);
    }

    // Print the length of the current car list after adding the vehicles
    print(currentCarList.length);
  } else {
    // Log a message if no search results are found
    log('No search results found');
  }
}

/// Opens a URL for a specific car deal.
///
/// Takes the [idVehicule] and [searchKey] as parameters and constructs a
/// URL for the car deal. The function then attempts to launch the URL using
/// the device's default browser.
///
/// Throws a [String] if the URL could not be launched.
Future<void> openCarDealUrl(String idVehicule, String searchKey) async {
  // The base URL for car deal URLs.
  String baseUrl = 'https://cars.booking.com/package/deal/';

  // Construct the full URL for the car deal using the [searchKey] and
  // [idVehicule].
  String fullUrl = '$baseUrl$searchKey/$idVehicule';

  // Parse the constructed URL into a Uri.
  Uri url = Uri.parse(fullUrl);

  // Check if the URL can be launched.
  if (await canLaunchUrl(url)) {
    // Attempt to launch the URL using the device's default browser.
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    // Throw an error if the URL could not be launched.
    throw 'Could not launch $fullUrl';
  }
}
