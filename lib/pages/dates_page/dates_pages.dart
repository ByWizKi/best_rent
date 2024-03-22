import 'package:best_rent/pages/dates_page/components/button_submit_date.dart';
import 'package:best_rent/pages/dates_page/components/date_picker.dart';
import 'package:best_rent/pages/dates_page/components/suggestion_date_widget.dart';
import 'package:best_rent/pages/dates_page/components/suggestion_text.dart';
import 'package:best_rent/pages/dates_page/components/text_top_section.dart';
import 'package:best_rent/pages/dates_page/components/time_picker.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DatesPage extends StatefulWidget {
  const DatesPage({super.key});

  @override
  State<DatesPage> createState() => _DatesPageState();
}

class _DatesPageState extends State<DatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTopSection(context),
            DatePicker(context),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timePicker(context, 'Debut'),
                const Spacer(),
                timePicker(context, 'Fin'),
              ],
            ),
            textSuggestionSection(context),
            Row(
              children: [
                suggestionDateSection(context, '1 Jour'),
                const Spacer(),
                suggestionDateSection(context, '2 Jours'),
                const Spacer(),
                suggestionDateSection(context, '1 Semaine'),
              ],
            ),
            Center(
              child: buttonSubmitDate(context),
            )
          ],
        ),
      ),
    );
  }
}
