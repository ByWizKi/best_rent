import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Widget DatePicker(context) {
  return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor2,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            )
          ]),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.range,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          calendarViewMode: DatePickerMode.day,
          lastMonthIcon: lastMonthIcon,
          nextMonthIcon: nextMonthIcon,
          weekdayLabels: labelDays(),
          weekdayLabelTextStyle: AppTextStyles.labelDaysTextStyle,
          selectedDayHighlightColor: AppColors.primaryColor,
          selectedRangeHighlightColor: AppColors.secondaryColorBis,
          dayTextStyle: AppTextStyles.daysTextStyle,
          rangeBidirectional: true,
          dayBorderRadius: BorderRadius.circular(10),
        ),
        value: [
          DateTime.now(),
          DateTime.now().add(const Duration(days: 1)),
        ],
        onValueChanged: (value) {},
      ));
}

List<String>? labelDays() {
  return [
    'Lun',
    'Mar',
    'Mer',
    'Jeu',
    'Ven',
    'Sam',
    'Dim',
  ];
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
