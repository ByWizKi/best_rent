import 'package:best_rent/pages/position_page/components/bottom_submit_section.dart';
import 'package:best_rent/pages/position_page/components/list_suggestion_section.dart';
import 'package:best_rent/pages/position_page/components/search_bar_section.dart';
import 'package:best_rent/pages/position_page/components/text_suggestion_section.dart';
import 'package:best_rent/pages/position_page/components/text_top_section.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PositionPage extends StatefulWidget {
  const PositionPage({super.key});

  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
  String cityName = 'SELECTIONNER UNE ZONE';
  @override
  void initState() {
    super.initState();
  }

  @override

  /// Builds the main widget for the PositionPage.
  ///
  /// This method is called when the widget is built and returns a Scaffold
  /// widget with a body that is a Container. The Container has padding, width,
  /// height, decoration, and a child Column. The Column has crossAxisAlignment
  /// set to start and children that include textTopSection, searchBarSection,
  /// textSuggestionSection, listSuggestionSection and bottomSubmitSection.
  Widget build(BuildContext context) {
    // Builds the main widget for the PositionPage.
    return Scaffold(
      // Scaffold widget for the app bar and below<|bot|>      // The Scaffold widget provides a base
      // material design visual layout structure. It is used here to provide
      // an app bar and a body.
      body: Container(
        // Container widget for the padding, width, height, and decoration
        // of the body.
        padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        // Column widget that arranges its children in a vertical array.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Children of the Column widget.
          children: [
            // Calls the textTopSection widget.
            textTopSection(context),
            // Calls the searchBarSection widget.
            searchBarSection(context),
            // Calls the textSuggestionSection widget.
            textSuggestionSection(context),
            // Calls the listSuggestionSection widget.
            listSuggestionSection(context),
            // Centers the bottomSubmitSection widget.
            Center(
              child: bottomSubmitSection(context),
            )
          ],
        ),
      ),
    );
  }
}
