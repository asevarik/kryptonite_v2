// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepPurple,
    textTheme: TextTheme(
      headline4: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyText1: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyText2: GoogleFonts.poppins(
        fontSize: 12,
      ),
      headline5: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
