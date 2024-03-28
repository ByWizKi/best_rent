import 'dart:developer';

import 'package:best_rent/services/date_picker/date_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  final String text;
  const TimePicker({super.key, required this.text});
  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String timeText = DateFormat('HH:mm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size(120, 60)),
          elevation: MaterialStateProperty.all(8),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          surfaceTintColor:
              const MaterialStatePropertyAll<Color>(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(AppColors.whiteColor),
        ),
        onPressed: () {
          DatePicker.showTimePicker(
            context,
            locale: LocaleType.fr,
            showTitleActions: true,
            showSecondsColumn: false,
            currentTime: DateTime.now(),
            onConfirm: (time) async {
              if (widget.text == 'Debut') {
                await updateTime(time, true)
                    .then((value) => {
                          setState(() {
                            timeText = DateFormat('HH:mm').format(time);
                          })
                        })
                    .catchError((value) => {
                          setState(() {
                            timeText =
                                DateFormat('HH:mm').format(DateTime.now());
                          }),
                          log(value)
                        });
              } else {
                await updateTime(time, false)
                    .then((value) => {
                          setState(() {
                            timeText = DateFormat('HH:mm').format(time);
                          })
                        })
                    .catchError((error) => {
                          setState(() {
                            timeText =
                                DateFormat('HH:mm').format(DateTime.now());
                          }),
                          log(error.toString())
                        });
              }
            },
          );
        },
        child: Column(children: [
          Text(
            widget.text,
            style: AppTextStyles.timePickerTextStyle,
          ),
          Text(
            timeText,
            style: AppTextStyles.timePickerTextStyle,
          ),
        ]));
  }
}
