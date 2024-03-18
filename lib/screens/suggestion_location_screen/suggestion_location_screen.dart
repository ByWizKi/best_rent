import 'package:best_rent/env/env.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_places_autocomplete_widgets/address_autocomplete_widgets.dart';

class SuggestionLocationScreen extends StatelessWidget {
  const SuggestionLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        margin: const EdgeInsets.all(100.0),
        width: MediaQuery.of(context).size.width,
        child: AddressAutocompleteTextField(
          mapsApiKey: Env.googleApiKey,
          overlayOffset: 1,
          language: 'fr',
          componentCountry: 'fr',
          elevation: 12,
          buildItem: (Suggestion suggestion, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    suggestion.description,
                  ),
                  const Divider(
                    height: 4.0,
                    color: AppColors.blackColor2,
                  ),
                ],
              ),
            );
          },
          decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            hintText: "ENTREZ UNE ADRESSE",
            errorText: null,
          ),
        ),
      ),
    );
  }
}
