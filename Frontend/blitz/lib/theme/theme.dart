// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(154, 207, 206, 1),
    hintColor: Color.fromRGBO(219, 237, 235, 1),
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade50,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.black,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Color.fromRGBO(219, 237, 235, 1),
      selectionHandleColor: Color.fromRGBO(219, 237, 235, 1),
    ),
    textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 47.78,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 39.81,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 33.18,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 27.65,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 23.04,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 19.2,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontFamily: 'GeneralSans',
          fontSize: 12.3,
          fontWeight: FontWeight.w400,
        )));

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromRGBO(219, 237, 235, 1),
  hintColor: Color.fromRGBO(162, 214, 213, 1),
  colorScheme: ColorScheme.dark(
    background: Color.fromRGBO(28, 30, 29, 1),
  ),
  textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 47.78,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 39.81,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 33.18,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 27.65,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 23.04,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 19.2,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: 'GeneralSans',
        fontSize: 12.3,
        fontWeight: FontWeight.w400,
      )),
);
