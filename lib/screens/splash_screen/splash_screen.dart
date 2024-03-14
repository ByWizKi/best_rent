import 'package:best_rent/env/env.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_places_autocomplete_widgets/address_autocomplete_widgets.dart';
import 'package:google_maps_places_autocomplete_widgets/widgets/address_autocomplete_textformfield.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("je suis la "),
        AddressAutocompleteTextFormField(
          mapsApiKey: Env.googleApiKey,
          componentCountry: 'fr',
          language: 'fr',
          // postalCodeLookup: true,

          onSuggestionClick: (address) {
            print(address);
          },
        ),
      ])),
    );
  }
}
