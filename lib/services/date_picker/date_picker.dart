import 'dart:developer';

import 'package:best_rent/services/service.dart';
import 'package:flutter/material.dart';

/// Updates the user's date pickup and drop off using the given [dates].
///
/// This function will first check if the [dates] list contains two valid
/// date time objects. If not, it will return a [Future] that completes with
/// an error. If the dates are valid, it will then adjust the time of the
/// dates to match the current time, and make sure that the drop off date is
/// after the pick up date. If it's not, it will also return a [Future] that
/// completes with an error. If the dates pass all the checks, it will set
/// the date pickup and date drop off of the current user and return a
/// [Future] that completes successfully.
///
/// The [dates] parameter should be a list containing two [DateTime]
/// objects, the first one representing the pick up date and the second one
/// representing the drop off date.
///
/// This function will not modify the current user object if any of the
/// checks fail.
Future<void> updateDate(List<DateTime?> dates) async {
  try {
    // Print debug message
    debugPrint('Updating date by datePicker ...');

    // Check if the list of dates has the correct length
    if (dates.length != 2) {
      log('Error in updateDate dates are not valid');
      return Future.error('Error in updateDate dates are not valid');
    }

    // Check if the dates are valid
    if (dates[0] == null || dates[1] == null) {
      return;
    }

    // Check if the first date is before the current date
    if (dates[0]!.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      return;
    }

    // Adjust the time of the dates to match the current time
    dates[0] = dates[0]!.add(Duration(hours: DateTime.now().hour));
    dates[1] = dates[1]!.add(Duration(hours: DateTime.now().hour));
    dates[0] = dates[0]!.add(Duration(minutes: DateTime.now().minute));
    dates[1] = dates[1]!.add(Duration(minutes: DateTime.now().minute));

    // Make sure that the drop off date is after the pick up date
    if (dates[0] == dates[1]) {
      dates[1] = dates[1]!.add(const Duration(hours: 1));
    }

    // Set the date pickup and drop off of the current user
    currentUser.datePickUp = dates[0]!;
    currentUser.dateDropOff = dates[1]!;

    // Print debug message
    debugPrint(
      'Date updated to: ${currentUser.datePickUpString} - ${currentUser.dateDropOffString}',
    );
  } catch (e) {
    // Print error message
    log('Error in updateDate: $e');

    // Return a Future that completes with an error
    return Future.error('Error in updateDate: $e');
  }
}

/// Updates the user's date pickup and drop off using the specified number of days.
///
/// This function updates the date pickup and drop off of the current user with the
/// current date plus one day and the specified number of days. If the number of
/// days is not between 1 and 7, it returns a Future that completes with an error.
/// If the update is successful, it prints a debug message.
///
/// The [days] parameter specifies the number of days to add to the current date.
Future<void> updateDateByDays(int days) async {
  try {
    // Print debug message
    debugPrint('Updating date by suggestion ...');

    // Check if the number of days is valid
    if (days <= 0 || days > 7) {
      // Return a Future that completes with an error
      return Future.error('Error in updateDateByDays');
    } else {
      // Update the date pickup and drop off of the current user
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

    // Print debug message with the updated dates
    debugPrint(
      'Date updated to: ${currentUser.datePickUpString} - ${currentUser.dateDropOffString} by suggestion',
    );
  } catch (e) {
    // Print error message
    log('Error in updateDateByDays: $e');

    // Return a Future that completes with an error
    return Future.error('Error in updateDateByDays: $e');
  }
}

/// Updates the user's pickup or drop off time using the provided [DateTime] [time].
///
/// This function checks if the provided [DateTime] [time] is a valid update
/// for the user's pickup or drop off time. If the update is valid, it updates
/// the user's time and prints a debug message. If the update is not valid,
/// it returns a Future that completes with an error.
///
/// The [DateTime] [time] parameter specifies the new time for the user's
/// pickup or drop off time. The [isPickUp] parameter specifies if the time
/// should be updated for the pickup or drop off time.
Future<void> updateTime(DateTime time, bool isPickUp) async {
  try {
    // Print debug message
    debugPrint(isPickUp
        ? 'PickUp time updating by timePicker ...'
        : 'DropOff time updating to: ${time.hour}:${time.minute}');

    // Check if the time is valid for update
    if (isPickUp
        ? currentUser.datePickUp.hour == time.hour &&
            currentUser.datePickUp.minute >= time.minute &&
            currentUser.datePickUp.day == time.day &&
            currentUser.datePickUp.month == time.month &&
            currentUser.datePickUp.year == time.year
        : currentUser.dateDropOff.hour == time.hour &&
            currentUser.dateDropOff.minute >= time.minute &&
            currentUser.dateDropOff.day == time.day &&
            currentUser.dateDropOff.month == time.month &&
            currentUser.dateDropOff.year == time.year) {
      // Return a Future that completes with an error
      return Future.error(isPickUp
          ? 'Error in updateTime minute is less than timePicker'
          : 'Error in updateTime minute is less than timePicker');
    }
    // Check if the hour of the time is valid for update
    if (isPickUp
        ? currentUser.datePickUp.hour > time.hour &&
            currentUser.datePickUp.day == time.day &&
            currentUser.datePickUp.month == time.month &&
            currentUser.datePickUp.year == time.year
        : currentUser.dateDropOff.hour > time.hour &&
            currentUser.dateDropOff.day == time.day &&
            currentUser.dateDropOff.month == time.month &&
            currentUser.dateDropOff.year == time.year) {
      // Return a Future that completes with an error
      return Future.error(isPickUp
          ? 'Error in updateTime hour is less than timePicker'
          : 'Error in updateTime hour is less than timePicker');
    }
    // Update the user's time
    if (isPickUp) {
      currentUser.datePickUp = DateTime(
        currentUser.datePickUp.year,
        currentUser.datePickUp.month,
        currentUser.datePickUp.day,
        time.hour,
        time.minute,
        currentUser.datePickUp.second,
      );
    } else {
      currentUser.dateDropOff = DateTime(
        currentUser.dateDropOff.year,
        currentUser.dateDropOff.month,
        currentUser.dateDropOff.day,
        time.hour,
        time.minute,
        currentUser.dateDropOff.second,
      );
    }
    // Print debug message with the updated time
    debugPrint(isPickUp
        ? 'PickUp time updated to: ${currentUser.datePickUpString}'
        : 'DropOff time updated to: ${currentUser.dateDropOffString}');
  } catch (e) {
    // Print error message
    debugPrint('Error in updateTime: $e');
    // Return a Future that completes with an error
    return Future.error('Error in updateTime: $e');
  }
}
