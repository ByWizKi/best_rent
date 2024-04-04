import 'dart:convert';

import 'package:best_rent/env/env.dart';
import 'package:best_rent/models/user/user.dart';
import 'package:http/http.dart' as http;

Future<List<double>> fetchRentalLocations(User user) async {
  const String url =
      'https://booking-com.p.rapidapi.com/v1/car-rental/locations';
  final Map<String, String> headers = {
    'X-RapidAPI-Key': Env.rapidApiKey,
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };
  final Map<String, String> params = {'locale': 'fr', 'name': user.cityName};

  final uri = Uri.parse(url).replace(queryParameters: params);
  try {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is List && data.isNotEmpty) {
        final double latitude = data[0]['latitude'];
        final double longitude = data[0]['longitude'];
        print('$latitude, $longitude');
        return [latitude, longitude];
      } else {
        print('No data available');
        return []; // Retourne une liste vide si aucune donnée n'est disponible
      }
    } else {
      print('Failed to fetch rental locations: ${response.statusCode}');
      return []; // Retourne une liste vide en cas d'échec de la requête
    }
  } catch (e) {
    print('An error occurred: $e');
    return []; // Retourne une liste vide en cas d'exception
  }
}

Future<void> searchVehicle(User user) async {
  List<double> rentalLocations = await fetchRentalLocations(user);

  // Vérifiez si rentalLocations contient au moins 2 éléments (latitude et longitude)
  if (rentalLocations.length < 2) {
    print('Rental locations data is incomplete.');
    return; // Sortie anticipée si les données sont incomplètes
  }

  // Utilisez les valeurs récupérées
  var latitude = rentalLocations[0];
  var longitude = rentalLocations[1];

  // Modification des const par des final pour les valeurs dynamiques
  const String url = 'https://booking-com.p.rapidapi.com/v1/car-rental/search';
  final Map<String, String> headers = {
    'X-RapidAPI-Key': Env.rapidApiKey,
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };

  // Utilisez String pour les valeurs qui sont dynamiques
  var params = {
    'locale': 'fr',
    'drop_off_longitude': '$longitude', // Conversion en String
    'pick_up_longitude': '$longitude', // Conversion en String
    'currency': 'EUR',
    'pick_up_datetime': user.datePickUpString,
    'drop_off_latitude': '$latitude', // Conversion en String
    'pick_up_latitude': '$latitude', // Conversion en String
    'from_country': 'fr',
    'sort_by': 'recommended',
    'drop_off_datetime': user.dateDropOffString
  };

  final uri = Uri.parse(url).replace(queryParameters: params);
  try {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['count']);
      print(jsonDecode(response.body));
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
