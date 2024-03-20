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
          searchBarSection(context),
          textSuggestionSection(context),
          listSuggestionSection(context),
          Center(
            child: bottomSubmitSection(context),
          )
        ],
      ),
    ));
  }
}
