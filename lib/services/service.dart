import 'package:best_rent/models/car/car.dart' as car;
import 'package:best_rent/models/user/user.dart' as user;

/// Returns a new `DateTime` object for the user pickup time, adding specified days to current date.
DateTime _createPickupTime(int daysToAdd) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + daysToAdd, 9);
}

/// Initialize the current user with pickup and dropoff dates.
user.User initializeCurrentUser() {
  return user.User(
    datePickUp: _createPickupTime(1),
    dateDropOff: _createPickupTime(2),
  );
}

void sortByPriceLowToHigh(List<car.Car> cars) {
  cars.sort((a, b) => a.price!.compareTo(b.price!));
}

void sortByPriceHighToLow(List<car.Car> cars) {
  cars.sort((a, b) => b.price!.compareTo(a.price!));
}

void sortByRating(List<car.Car> cars) {
  cars.sort((a, b) => b.ratings!.compareTo(a.ratings!));
}

List<car.Car> currentCarList = [];

final currentUser = initializeCurrentUser();
