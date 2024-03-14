import 'package:geolocator/geolocator.dart';

class User {
  // Attributes
  /* DateTime Format = YYYY-MM-DD HH:MM:SS */
  Position? _position;
  DateTime? _datePickUp;
  DateTime? _dateDropOff;
  int? _age = 21;
  String? _cityName;

  // Methods

  User(
      {DateTime? datePickUp,
      DateTime? dateDropOff,
      int? age,
      String? cityName,
      Position? position}) {
    _datePickUp = datePickUp;
    _dateDropOff = dateDropOff;
    _age = age;
    _cityName = cityName;
    _position = position;
  }
  // Getters
  DateTime get datePickUp => _datePickUp!;
  DateTime get dateDropOff => _dateDropOff!;
  int get age => _age!;
  String get cityName => _cityName!;
  Position get position => _position!;

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

  set cityName(String cityName) {
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
    try {
      if (_datePickUp == null || _dateDropOff == null) return false;
      if (_datePickUp!.isAfter(_dateDropOff!)) return false;
      if (_datePickUp!
          .isBefore(DateTime.now().subtract(const Duration(minutes: 1)))) {
        return false;
      }
      if (!_datePickUp!.isUtc) return false;
      if (!_dateDropOff!.isUtc) return false;
    } catch (e) {
      return false;
    }
    return true;
  }

  // Methods
}
