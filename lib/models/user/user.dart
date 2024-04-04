import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class User {
  // Attributes
  /* DateTime Format = YYYY-MM-DD HH:MM:SS */
  Position? _position;
  DateTime? _datePickUp = DateTime.now();
  DateTime? _dateDropOff = DateTime.now().add(const Duration(days: 1));
  int? _age = 21;
  String? _cityName;

  // Methods

  // Constructors
  User(
      {DateTime? datePickUp,
      DateTime? dateDropOff,
      int? age,
      String? cityName,
      Position? position}) {
    _datePickUp = datePickUp;
    _dateDropOff = dateDropOff;
    _age = age;
    _position = position;
    _cityName = cityName;
  }

  // Getters
  DateTime get datePickUp => _datePickUp!;

  String get datePickUpString =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(_datePickUp!);

  String get dateDropOffString =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(_dateDropOff!);

  DateTime get dateDropOff => _dateDropOff!;
  int get age => _age!;

  Position get position => _position!;

  String get latitude => _position!.latitude.toString();

  String get longitude => _position!.longitude.toString();

  String get cityName => _cityName ?? '';
  // Setters
  set position(Position position) {
    _position = position;
  }

  set datePickUp(DateTime datePickUp) {
    _datePickUp = datePickUp;
  }

  set dateDropOff(DateTime dateDropOff) {
    _dateDropOff = dateDropOff;
  }

  set age(int age) {
    _age = age;
    if (!checkAge()) _age = 21;
  }

  set cityName(String? cityName) {
    _cityName = cityName;
  }

  // Check Data
  bool checkAge() {
    try {
      if (_age == null) return false;
      if (_age!.isNaN) return false;
      if (_age!.isNegative) return false;
    } catch (e) {
      return false;
    }
    return true;
  }

  bool checkDate() {
    if (_datePickUp == null) return false;
    if (_dateDropOff == null) return false;
    if (_datePickUp!.isAfter(_dateDropOff!)) return false;
    if (_datePickUp!
        .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      return false;
    }
    if (_dateDropOff!
        .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      return false;
    }
    return true;
  }
}
