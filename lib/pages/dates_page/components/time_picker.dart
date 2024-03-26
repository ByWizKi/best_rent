import 'package:best_rent/services/date_picker/date_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class TimePicker extends StatefulWidget {
  final String text;
  const TimePicker({super.key, required this.text});
  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String time = '09:00';
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
            showTitleActions: true,
            showSecondsColumn: false,
            onConfirm: (time) async {
              setState(
                () {
                  this.time = '${time.hour}:${time.minute}';
                },
              );
              if (widget.text == 'Debut') {
                await updateTime(time, true);
              } else {
                await updateTime(time, false);
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
            time,
            style: AppTextStyles.timePickerTextStyle,
          ),
        ]));
  }
}
