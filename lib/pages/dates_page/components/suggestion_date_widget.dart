import 'package:flutter/material.dart';

Widget suggestionDateSection(context, text) {
  return ElevatedButton(
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size(90, 40)),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ))),
    onPressed: () => {},
    child: Text(text),
  );
}
