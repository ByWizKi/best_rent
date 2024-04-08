import 'package:best_rent/services/date_picker/date_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Widget datePicker(context) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(62, 62, 62, 0.527),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]),
    child: CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        calendarType: CalendarDatePicker2Type.range,
        firstDate: DateTime.now().add(const Duration(days: 1)),
        calendarViewMode: DatePickerMode.day,
        lastMonthIcon: lastMonthIcon,
        nextMonthIcon: nextMonthIcon,
        centerAlignModePicker: true,
        customModePickerIcon: const SizedBox(),
        controlsTextStyle: AppTextStyles.controlsTextStyle,
        weekdayLabelTextStyle: AppTextStyles.labelDaysTextStyle,
        dayTextStyle: AppTextStyles.daysTextStyle,
        selectedRangeDayTextStyle: AppTextStyles.selectedDaysTextStyle,
        selectedDayTextStyle: AppTextStyles.selectedDaysTextStyle,
        rangeBidirectional: true,
        selectedDayHighlightColor: AppColors.primaryColor,
        selectedRangeHighlightColor: AppColors.secondaryColorBis,
        dayBorderRadius: BorderRadius.circular(10),
      ),
      value: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
      ],
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
