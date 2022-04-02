import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static dark() {
    return ThemeData.from(
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto(
            fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        headline2: GoogleFonts.roboto(
            fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        headline3:
            GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
        headline4: GoogleFonts.roboto(
            fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        headline5:
            GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
        headline6: GoogleFonts.roboto(
            fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        subtitle1: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        subtitle2: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyText1: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        bodyText2: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        button: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Colors.white,
        ),
        caption: GoogleFonts.roboto(
            fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        overline: GoogleFonts.roboto(
            fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
      ),
      colorScheme: ColorScheme.dark(
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
      ),
    ).copyWith(
      dividerTheme: const DividerThemeData(space: 0, color: Colors.white24),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(Colors.white54),
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // light icon for Android
          statusBarBrightness: Brightness.dark, // light icon for IOS
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white54),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white54),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.black,
        selectionHandleColor: Colors.white,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: Colors.white38,
        borderColor: Colors.white24,
        selectedColor: Colors.white,
        selectedBorderColor: Colors.white24,
        fillColor: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  static light() {
    return ThemeData.from(
        colorScheme: ColorScheme.light(
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
    )).copyWith(
      dividerTheme: const DividerThemeData(space: 0, color: Colors.black26),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.black12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // dark icon for Android
          statusBarBrightness: Brightness.light, // dark icon for IOS
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white24),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black54),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.white,
        selectionHandleColor: Colors.black,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: Colors.black38,
        borderColor: Colors.black26,
        selectedColor: Colors.black,
        selectedBorderColor: Colors.black26,
        fillColor: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  static blue() {
    return ThemeData.from(
        colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red.shade200,
      onError: Colors.red.shade900,
    )).copyWith(
      dividerTheme: const DividerThemeData(space: 0, color: Colors.black26),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.black12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // dark icon for Android
          statusBarBrightness: Brightness.light, // dark icon for IOS
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white24),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black54),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.white,
        selectionHandleColor: Colors.black,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: Colors.black38,
        borderColor: Colors.black26,
        selectedColor: Colors.black,
        selectedBorderColor: Colors.black26,
        fillColor: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  static red() {
    return ThemeData.from(
        colorScheme: ColorScheme.light(
      primary: Colors.red,
      onPrimary: Colors.white,
      secondary: Colors.red,
      onSecondary: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red.shade200,
      onError: Colors.red.shade900,
    )).copyWith(
      dividerTheme: const DividerThemeData(space: 0, color: Colors.black26),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.black12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // dark icon for Android
          statusBarBrightness: Brightness.light, // dark icon for IOS
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white24),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black54),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.white,
        selectionHandleColor: Colors.black,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: Colors.black38,
        borderColor: Colors.black26,
        selectedColor: Colors.black,
        selectedBorderColor: Colors.black26,
        fillColor: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
