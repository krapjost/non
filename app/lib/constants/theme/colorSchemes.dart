import 'package:flutter/material.dart';

ColorScheme darkMode = ColorScheme.dark(
  primary: Colors.black,
  onPrimary: Colors.white,
  secondary: Colors.brown,
  onSecondary: Colors.white,
  background: Colors.black,
  onBackground: Colors.white,
  surface: Colors.black,
  onSurface: Colors.white,
  error: Colors.red.shade900,
  onError: Colors.red.shade200,
);

ColorScheme lightMode = ColorScheme.light(
  primary: Colors.white,
  onPrimary: Colors.black,
  secondary: Colors.brown,
  onSecondary: Colors.black,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red.shade200,
  onError: Colors.red.shade900,
);
