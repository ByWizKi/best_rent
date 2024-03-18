import 'package:best_rent/pages/position_page/components/bottomSubmitSection.dart';
import 'package:best_rent/pages/position_page/components/list_suggestion_section.dart';
import 'package:best_rent/pages/position_page/components/search_bar_section.dart';
import 'package:best_rent/pages/position_page/components/text_suggestion_section.dart';
import 'package:best_rent/pages/position_page/components/text_top_section.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PositionPage extends StatelessWidget {
  const PositionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(gradient: AppColors.gradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTopSection(context),
              searchBarSection(context),
              textSuggestionSection,
              listSuggestionSection,
              bottomSubmitSection,
            ],
          ),
        ));
  }
}
