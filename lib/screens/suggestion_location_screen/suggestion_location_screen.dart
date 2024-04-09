import 'package:best_rent/screens/suggestion_location_screen/components/text_field.dart';
import 'package:best_rent/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// Screen for suggesting a location.
///
/// This screen is responsible for suggesting a location for a user. It displays
/// a text field with autocomplete suggestions.
class SuggestionLocationScreen extends StatefulWidget {
  /// Constructs a [SuggestionLocationScreen].
  ///
  /// The [key] parameter is passed to the [State] of the [SuggestionLocationScreen].
  const SuggestionLocationScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionLocationScreen> createState() =>
      _SuggestionLocationScreenState();
}

class _SuggestionLocationScreenState extends State<SuggestionLocationScreen> {
  @override
  Widget build(BuildContext context) {
    /// Builds the [SuggestionLocationScreen].
    ///
    /// This method builds a [Scaffold] with an [AppBar] and a [GestureDetector].
    /// The [GestureDetector] wraps a [Container] with a [Column] child.
    ///
    /// The [Container] has a width and height equal to the size of the
    /// [MediaQuery]. It also has a gradient [BoxDecoration]. The [Column]
    /// contains a [Padding] widget with a [textFieldAutoSuggestion] widget.
    ///
    /// The [AppBar] has a [backgroundColor] set to the primary color of the
    /// [Theme].
    ///
    /// The [GestureDetector] listens for onTap events and calls
    /// [FocusScope.of(context).unfocus()] to unfocus the current focus and
    /// [Navigator.pop(context)] to pop the current route off the navigator.
    ///
    /// Returns the built [Scaffold].
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
