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

  /// Builds the user interface representing the [DatesPage].
  ///
  /// The [build] method is called when Flutter needs to paint the widget onto
  /// the screen. It returns a [Widget] that represents the UI of the page.
  ///
  /// The UI consists of a [Scaffold] widget with a scrollable [SingleChildScrollView]
  /// containing a [Container] widget. The container has padding, width, and
  /// height derived from the [MediaQuery]. It also has a gradient background
  /// defined by [AppColors.gradient]. Inside the container, there is a [Column]
  /// widget containing various UI elements.
  ///
  /// The UI elements include:
  ///  - [textTopSection]: The top section of the UI with a text widget.
  ///  - [datePicker]: The date picker widget.
  ///  - [TimePicker] widgets for start and end time selection.
  ///  - [textSuggestionSection]: The suggestion text section widget.
  ///  - A row of [suggestionDateSection] widgets for different duration suggestions.
  ///  - A [buttonSubmitDate] widget at the bottom of the UI.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SingleChildScrollView wraps the UI to enable scrolling.
      body: SingleChildScrollView(
        // Container wraps the UI with padding, width, and height.
        child: Container(
          padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // BoxDecoration defines the gradient background.
          decoration: const BoxDecoration(gradient: AppColors.gradient),
          // Column wraps the UI elements in a vertical layout.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text widget for the top section of the UI.
              textTopSection(context),
              // Date picker widget.
              datePicker(context),
              // Row of time picker widgets and spacers.
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimePicker(text: 'Debut'),
                  Spacer(),
                  TimePicker(text: 'Fin'),
                ],
              ),
              // Text widget for the suggestion text section.
              textSuggestionSection(context),
              // Row of suggestion date section widgets.
              Row(
                children: [
                  suggestionDateSection(context, '1 Jour'),
                  const Spacer(),
                  suggestionDateSection(context, '2 Jours'),
                  const Spacer(),
                  suggestionDateSection(context, '1 Semaine'),
                ],
              ),
              // Empty space at the bottom of the UI.
              const SizedBox(
                height: 40,
              ),
              // Button widget for submitting the date.
              Center(
                child: buttonSubmitDate(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
