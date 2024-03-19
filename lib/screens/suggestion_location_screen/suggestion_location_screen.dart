import 'package:best_rent/env/env.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_places_autocomplete_widgets/address_autocomplete_widgets.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primaryColor,
        title: textFieldAutoSuggestion(context),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: AppColors.gradient,
          ),
        ),
      ),
    );
  }
}

Widget textFieldAutoSuggestion(context) {
  return AddressAutocompleteTextField(
    mapsApiKey: Env.googleApiKey,
    autofocus: true,
    componentCountry: 'fr',
    language: 'fr',
    style: AppTextStyles.suggestionStyleInput,
    overlayOffset: 0,
    decoration: const InputDecoration(
      filled: true,
      fillColor: AppColors.whiteColor,
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      hintText: 'Saisissez votre adresse',
    ),
    suggestionsOverlayDecoration: const BoxDecoration(
      color: AppColors.whiteColor,
      border: Border(
        top: BorderSide(
          color: AppColors.blackColor,
          width: 2,
        ),
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
  );
}
