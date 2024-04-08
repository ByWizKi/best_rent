import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:best_rent/env/env.dart';
import 'package:best_rent/models/car/car.dart';
import 'package:best_rent/models/user/user.dart';
import 'package:best_rent/services/service.dart';
import 'package:http/http.dart' as http;

Future<List<double>> fetchRentalLocations(User user) async {
  const String url =
      'https://booking-com.p.rapidapi.com/v1/car-rental/locations';
  final headers = {
    'X-RapidAPI-Key': Env.rapidApiKey,
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };
  final params = {'locale': 'fr', 'name': user.cityName};

  final uri = Uri.parse(url).replace(queryParameters: params);
  try {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return _parseLocationData(data);
    } else {
      throw HttpException(
          'Failed to fetch locations with status: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    log('Error parsing JSON data: $e');
  } on HttpException catch (e) {
    log(e.message);
  } catch (e) {
    log('General error occurred: $e');
  }
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

Future<void> searchVehicle(User user) async {
  try {
    List<double> rentalLocations = await fetchRentalLocations(user);
    if (rentalLocations.length < 2) {
      throw Exception('Incomplete location data.');
    }
    await _searchForVehicles(rentalLocations, user);
  } catch (e) {
    log('Error searching vehicles: $e');
  }
}

Future<void> _searchForVehicles(List<double> locations, User user) async {
  const String url = 'https://booking-com.p.rapidapi.com/v1/car-rental/search';
  final headers = {
    'X-RapidAPI-Key': Env.rapidApiKey,
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };
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

  final uri = Uri.parse(url).replace(queryParameters: params);
  final response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    _handleSearchResults(data);
  } else {
    throw HttpException(
        'Failed to fetch vehicles with status: ${response.statusCode}');
  }
}

void _handleSearchResults(Map<String, dynamic> data) {
  if (data['search_results'] is List) {
    for (var vehicleJson in data['search_results']) {
      Car car = Car.fromJson(vehicleJson);
      car.searchKey = data['search_key'];
      currentCarList.add(car);
    }
    print(currentCarList.length);
  } else {
    log('No search results found');
  }
}
