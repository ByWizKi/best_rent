import 'dart:developer';

import 'package:best_rent/services/service.dart';
import 'package:flutter/material.dart';

Future<void> updateDate(List<DateTime?> dates) async {
  try {
    debugPrint('Updating date by datePicker ...');
    if (dates.length == 2) {
      if (dates[0] == null || dates[1] == null) return;
      if (dates[0]!.isAfter(dates[1]!)) return;
      if (dates[0]!
          .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
        return;
      }

      dates[0] = dates[0]!.add(Duration(hours: DateTime.now().hour));
      dates[1] = dates[1]!.add(Duration(hours: DateTime.now().hour));
      dates[0] = dates[0]!.add(Duration(minutes: DateTime.now().minute));
      dates[1] = dates[1]!.add(Duration(minutes: DateTime.now().minute));
      if (dates[0] == dates[1]) {
        dates[1] = dates[1]!.add(const Duration(hours: 1));
      }
      currentUser.datePickUp = dates[0]!;
      currentUser.dateDropOff = dates[1]!;

      debugPrint(
        'Date updated to: ${currentUser.datePickUpString} - ${currentUser.dateDropOffString}',
      );
    } else {
      log('Error in updateDate dates are not valid');
      return Future.error('Error in updateDate dates are not valid');
    }
  } catch (e) {
    // debugPrint('Error in updateDate: $e');
    log('Error in updateDate: $e');
    return Future.error('Error in updateDate: $e');
  }
}

Future<void> updateDateByDays(int days) async {
  try {
    debugPrint('Updating date by suggestion ...');
    if (days <= 0 || days > 7) {
      return Future.error('Error in updateDateByDays');
    } else {
      currentUser.datePickUp = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().add(const Duration(days: 1)).day,
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second,
      );
      currentUser.dateDropOff =
          currentUser.datePickUp.add(Duration(days: days));
    }
    debugPrint(
      'Date updated to: ${currentUser.datePickUpString} - ${currentUser.dateDropOffString} by suggestion',
    );
  } catch (e) {
    // debugPrint('Error in updateDateByDays: $e');
    log('Error in updateDateByDays: $e');
    return Future.error('Error in updateDateByDays: $e');
  }
}

Future<void> updateTime(DateTime time, isPickUp) async {
  try {
    if (isPickUp) {
      debugPrint('PickUp time updating by timePicker ...');
      if (currentUser.datePickUp.hour == time.hour &&
          currentUser.datePickUp.minute >= time.minute &&
          currentUser.datePickUp.day == time.day &&
          currentUser.datePickUp.month == time.month &&
          currentUser.datePickUp.year == time.year) {
        return Future.error(
            'Error in updateTime minute is less than timePicker');
      }
      if (currentUser.datePickUp.hour > time.hour &&
          currentUser.datePickUp.day == time.day &&
          currentUser.datePickUp.month == time.month &&
          currentUser.datePickUp.year == time.year) {
        return Future.error('Error in updateTime hour is less than timePicker');
      }
      currentUser.datePickUp = DateTime(
        currentUser.datePickUp.year,
        currentUser.datePickUp.month,
        currentUser.datePickUp.day,
        time.hour,
        time.minute,
        currentUser.datePickUp.second,
      );
      debugPrint('PickUp time updated to: ${currentUser.datePickUpString}');
    } else {
      debugPrint('DropOff time updating to: ${time.hour}:${time.minute}');
      if (currentUser.dateDropOff.hour == time.hour &&
          currentUser.dateDropOff.minute >= time.minute &&
          currentUser.dateDropOff.day == time.day &&
          currentUser.dateDropOff.month == time.month &&
          currentUser.dateDropOff.year == time.year) {
        return Future.error(
            'Error in updateTime minute is less than timePicker');
      }
      if (currentUser.dateDropOff.hour > time.hour &&
          currentUser.dateDropOff.day == time.day &&
          currentUser.dateDropOff.month == time.month &&
          currentUser.dateDropOff.year == time.year) {
        return Future.error('Error in updateTime hour is less than timePicker');
      }
      currentUser.dateDropOff = DateTime(
        currentUser.dateDropOff.year,
        currentUser.dateDropOff.month,
        currentUser.dateDropOff.day,
        time.hour,
        time.minute,
        currentUser.dateDropOff.second,
      );
      debugPrint('DropOff time updated to: ${currentUser.dateDropOffString}');
    }
  } catch (e) {
    debugPrint('Error in updateTime: $e');
    return Future.error('Error in updateTime: $e');
  }
}
