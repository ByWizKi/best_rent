import 'package:best_rent/screens/suggestion_location_screen/components/text_field.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SuggestionLocationScreen extends StatefulWidget {
  const SuggestionLocationScreen({super.key});

  @override
  State<SuggestionLocationScreen> createState() =>
      _SuggestionLocationScreenState();
}

class _SuggestionLocationScreenState extends State<SuggestionLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Future.delayed(const Duration(microseconds: 100), () {
            Navigator.pop(context);
          });
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: AppColors.gradient,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: textFieldAutoSuggestion(context),
                )
              ],
            )),
      ),
    );
  }
}
