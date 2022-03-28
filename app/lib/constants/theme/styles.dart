import 'package:flutter/material.dart';

final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  textStyle: const TextStyle(color: Colors.white, fontSize: 18),
  side: const BorderSide(width: 1.0, color: Colors.brown),
  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);
