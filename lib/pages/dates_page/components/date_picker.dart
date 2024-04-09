import 'package:best_rent/services/date_picker/date_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

/// Widget that displays a date picker.
///
/// This widget displays a date picker that allows the user to select a range
/// of dates. It is styled with the provided app colors and styles.
///
/// The [context] parameter is the build context of the widget.
///
/// The function returns a container widget that wraps a calendar date picker
/// widget. The container has padding and a decoration with a border radius.
/// The calendar date picker displays the selected range of dates and provides
/// controls to navigate between months. The configuration of the calendar date
/// picker is set using the [CalendarDatePicker2Config] class. The value of the
/// date picker is obtained using the [value] parameter and the selected dates
/// are updated using the [onValueChanged] function.
Widget datePicker(BuildContext context) {
  return Container(
    // Margin at the top and bottom of the container.
    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    // Padding around the content of the container.
    padding: const EdgeInsets.all(10),
    // Decoration of the container.
    decoration: const BoxDecoration(
      color: AppColors.whiteColor, // Background color of the container.
      borderRadius: BorderRadius.all(
          Radius.circular(20.0)), // Border radius of the container.
      boxShadow: [
        // Box shadow effect of the container.
        BoxShadow(
          color: Color.fromRGBO(62, 62, 62, 0.527), // Color of the shadow.
          spreadRadius: 3, // Spread radius of the shadow.
          blurRadius: 10, // Blur radius of the shadow.
          offset: Offset(0, 3), // Offset of the shadow.
        )
      ],
    ),
    // Calendar date picker widget.
    child: CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        calendarType:
            CalendarDatePicker2Type.range, // Type of the calendar date picker.
        firstDate: DateTime.now()
            .add(const Duration(days: 1)), // First date that can be selected.
        calendarViewMode: DatePickerMode.day, // Calendar view mode.
        lastMonthIcon:
            lastMonthIcon, // Icon for navigating to the previous month.
        nextMonthIcon: nextMonthIcon, // Icon for navigating to the next month.
        centerAlignModePicker: true, // Align the picker to the center.
        customModePickerIcon: const SizedBox(), // Custom icon for the picker.
        controlsTextStyle:
            AppTextStyles.controlsTextStyle, // Text style for the controls.
        weekdayLabelTextStyle: AppTextStyles
            .labelDaysTextStyle, // Text style for the weekday labels.
        dayTextStyle: AppTextStyles.daysTextStyle, // Text style for the days.
        selectedRangeDayTextStyle: AppTextStyles
            .selectedDaysTextStyle, // Text style for the selected range of days.
        selectedDayTextStyle: AppTextStyles
            .selectedDaysTextStyle, // Text style for the selected day.
        rangeBidirectional:
            true, // Allow selection of dates in both directions.
        selectedDayHighlightColor:
            AppColors.primaryColor, // Highlight color for the selected day.
        selectedRangeHighlightColor: AppColors
            .secondaryColorBis, // Highlight color for the selected range of days.
        dayBorderRadius: BorderRadius.circular(10), // Border radius of the day.
      ),
      value: [
        DateTime.now()
            .add(const Duration(days: 1)), // Start date of the selected range.
        DateTime.now()
            .add(const Duration(days: 2)), // End date of the selected range.
      ],
      // Function called when the value of the date picker changes.
      onValueChanged: (value) async {
        if (value.length == 2) {
          await updateDate(value);
        }
      },
    ),
  );
}

BoxDecoration decorationDatePicker() {
  return const BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );
}

Widget lastMonthIcon = const Icon(
  Icons.arrow_back_ios,
  color: AppColors.primaryColor,
);

Widget nextMonthIcon = const Icon(
  Icons.arrow_forward_ios,
  color: AppColors.primaryColor,
);
