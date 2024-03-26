import 'package:best_rent/models/user/user.dart' as user;

user.User currentUser = user.User(
    datePickUp: DateTime.now(),
    dateDropOff: DateTime.now().add(const Duration(days: 1)));
