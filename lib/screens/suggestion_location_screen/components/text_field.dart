import 'dart:developer';

import 'package:best_rent/env/env.dart';
import 'package:best_rent/services/geo_position/geo_position.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:best_rent/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_places_autocomplete_widgets/widgets/address_autocomplete_textfield.dart';

Widget textFieldAutoSuggestion(context) {
  return AddressAutocompleteTextField(
    mapsApiKey: Env.googleApiKey,
    autofocus: true,
    componentCountry: 'fr',
    language: 'fr',
    initialValue: '',
    style: AppTextStyles.suggestionStyleInput,
    overlayOffset: 0,
    debounceTime: 100,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.whiteColor,
      focusColor: AppColors.blackColor,
      border: InputBorder.none,
      labelStyle: AppTextStyles.suggestionStyleInput,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
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
          width: 3,
        ),
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    buildItem: (Suggestion suggestion, int index) {
      return Container(
        margin: const EdgeInsets.fromLTRB(2, 6, 6, 2),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text(
          suggestion.description,
          textAlign: TextAlign.center,
          style: AppTextStyles.suggestionStyle,
        ),
      );
    },
    onSuggestionClick: (place) {
      try {
        FocusScope.of(context).unfocus();
        Future.delayed(const Duration(milliseconds: 100));
        // debugPrint('Suggestion clicked: ${place.description}');
        // Test if lat and lng are not null
        if (place.lat == null || place.lng == null) {
          throw Exception('lat or lng is null');
        }
        // update current user position based on suggestion
        updatedPositionFromCoordinates(place.lat!, place.lng!);
        // debugPrint('Position updated from suggestion: ${place.lat!}, ${place.lng!}');
        Navigator.pop(context);
      } catch (error) {
        log('Error in suggestion click: $error user position not updated');
        // debugPrint('Error in suggestion click: $error user position not updated');
      }
    },
  );
}
