import 'dart:developer';

import 'package:best_rent/services/service.dart';
import 'package:flutter/material.dart';

Future<void> updateDate(List<DateTime?> dates) async {
  try {
    if (dates.length == 2) {
      if (dates[0] == null || dates[1] == null) return;
      if (dates[0]!.isAfter(dates[1]!)) return;
      if (dates[0]!
          .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
        return;
      }
      currentUser.datePickUp = dates[0]!;
      currentUser.dateDropOff = dates[1]!;
      log(currentUser.datePickUpString);
      log(currentUser.dateDropOffString);
    } else {
      return Future.error('Error in updateDate dates are not valid');
    }
  } catch (e) {
    // debugPrint('Error in updateDate: $e');
    return Future.error('Error in updateDate: $e');
  }
}

Future<void> updateTime(DateTime time, isPickUp) async {
  debugPrint(currentUser.datePickUp.toString());
  try {
    if (isPickUp) {
      debugPrint('PickUp time updating to: ${time.hour}:${time.minute}');

      currentUser.datePickUp = DateTime(
        currentUser.datePickUp.year,
        currentUser.datePickUp.month,
        currentUser.datePickUp.day,
        time.hour,
        time.minute,
        currentUser.datePickUp.second,
      );
      debugPrint(
          'PickUp time updated to: ${currentUser.datePickUp.toString()}');
    } else {
      debugPrint('DropOff time updating to: ${time.hour}:${time.minute}');
      currentUser.dateDropOff = DateTime(
        currentUser.dateDropOff.year,
        currentUser.dateDropOff.month,
        currentUser.dateDropOff.day,
        time.hour,
        time.minute,
        currentUser.dateDropOff.second,
      );
      debugPrint(
          'DropOff time updated to: ${currentUser.dateDropOff.toString()}');
    }
  } catch (e) {
    // debugPrint('Error in updateTime: $e');
    return Future.error('Error in updateTime: $e');
  }
}
