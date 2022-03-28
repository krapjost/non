import 'package:flutter/material.dart';

final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 18),
  side: const BorderSide(width: 1.0),
  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);
