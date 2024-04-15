import 'package:best_rent/models/car/car.dart' as car;
import 'package:best_rent/models/user/user.dart' as user;

/// Returns a new `DateTime` object for the user pickup time, adding specified days to current date.
///
/// The function takes an integer [daysToAdd] that represents the number of days
/// to add to the current date. It returns a new `DateTime` object with the
/// desired date.
DateTime _createPickupTime(int daysToAdd) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + daysToAdd, 9);
}

/// Initialize the current user with pickup and dropoff dates.
///
/// The function creates a new `user.User` object with the current date plus 1
/// day for the pickup date and 2 days for the dropoff date.
user.User initializeCurrentUser() {
  return user.User(
    datePickUp: _createPickupTime(1),
    dateDropOff: _createPickupTime(2),
  );
}

/// Sorts a list of [car.Car] objects by their price in ascending order.
void sortByPriceLowToHigh(List<car.Car> cars) {
  cars.sort((a, b) => a.price!.compareTo(b.price!));
}

/// Sorts a list of [car.Car] objects by their price in descending order.
void sortByPriceHighToLow(List<car.Car> cars) {
  cars.sort((a, b) => b.price!.compareTo(a.price!));
}

/// Sorts a list of [car.Car] objects by their rating in descending order.
void sortByRating(List<car.Car> cars) {
  cars.sort((a, b) => b.ratings!.compareTo(a.ratings!));
}

/// Filters a list of [car.Car] objects by their model and updates the list.
///
/// The function takes a list of [car.Car] objects and a [String] [model].
/// It filters the list by the model and updates the list. If the model is
/// 'Tous', the function returns without modifying the list. If the model is
/// 'Luxe', it changes it to 'de Luxe'. The function then maps the list by
/// checking if each [car.Car]'s group is equal to the model and returns the
/// list. Finally, it prints the length of the list.
void sortByModels(List<car.Car> cars, String model) {
  if (model == 'Tous') {
    return;
  }
  if (model == 'Luxe') model = 'de Luxe';
  cars.map((car) => car.group! == model).toList();
}

/// An empty list of [car.Car] objects.
List<car.Car> currentCarList = [];

/// The current user initialized with pickup and dropoff dates.
final currentUser = initializeCurrentUser();
