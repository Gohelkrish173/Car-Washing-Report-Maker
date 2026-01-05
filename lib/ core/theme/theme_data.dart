import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_color.dart';


class Theme_Data{

  static final lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: App_Color.lightBackground,
    fontFamily: GoogleFonts.inter().fontFamily,

    colorScheme: ColorScheme.light(
      background: App_Color.lightBackground,
      surface: App_Color.lightSurface,
      primary: App_Color.lightPrimary,
      secondary: App_Color.lightSecondary,
    ),

    // ---------------- TEXT ----------------
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: App_Color.lightTextPrimary),
      headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: App_Color.lightTextPrimary),
      bodyLarge: TextStyle(fontSize: 16, color: App_Color.lightTextPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: App_Color.lightTextSecondary),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    ),

    // ---------------- APPBAR ----------------
    appBarTheme: AppBarTheme(
      backgroundColor: App_Color.lightSurface,
      foregroundColor: App_Color.lightTextPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // ---------------- BUTTONS ----------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: App_Color.lightPrimary,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    // ---------------- INPUT FIELDS ----------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: App_Color.lightSurface,
      hintStyle: TextStyle(color: App_Color.lightTextSecondary),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: App_Color.lightSecondary.withOpacity(0.3)),
      ),
    ),

    // ---------------- CARDS ----------------
    cardTheme: CardThemeData(
      color: App_Color.lightSurface,
      elevation: 0,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: App_Color.darkBackground,
    fontFamily: GoogleFonts.inter().fontFamily,

    colorScheme: ColorScheme.dark(
      background: App_Color.darkBackground,
      surface: App_Color.darkSurface,
      primary: App_Color.darkPrimary,
      secondary: App_Color.darkSecondary,
    ),

    // ---------------- TEXT ----------------
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: App_Color.darkTextPrimary),
      headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: App_Color.darkTextPrimary),
      bodyLarge: TextStyle(fontSize: 16, color: App_Color.darkTextPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: App_Color.darkTextSecondary),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    ),

    // ---------------- APPBAR ----------------
    appBarTheme: AppBarTheme(
      backgroundColor: App_Color.darkSurface,
      foregroundColor: App_Color.darkTextPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // ---------------- BUTTONS ----------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: App_Color.darkPrimary,
        foregroundColor: Colors.black,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    // ---------------- INPUT FIELDS ----------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: App_Color.darkSurface,
      hintStyle: TextStyle(color: App_Color.darkTextSecondary),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: App_Color.darkSecondary.withOpacity(0.3)),
      ),
    ),

    // ---------------- CARDS ----------------
    cardTheme: CardThemeData(
      color: App_Color.darkSurface,
      elevation: 0,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

}