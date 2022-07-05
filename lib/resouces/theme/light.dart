import 'package:flutter/material.dart';

import 'colors.dart';

class LightTheme {
  ThemeData get theme => ThemeData.light().copyWith(
        brightness: Brightness.light,
        colorScheme: CustomColors.lightColorScheme,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.black.withOpacity(.1),
        buttonTheme: ButtonThemeData(
          highlightColor: Colors.black.withOpacity(.2),
          splashColor: Colors.black,
        ),
        highlightColor: Colors.black.withOpacity(0.2),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          errorStyle: const TextStyle(
            color: Color.fromRGBO(199, 44, 32, 1.0),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: CustomColors.lightColorScheme.secondary,
          circularTrackColor: Colors.white.withOpacity(0.5),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(169, 169, 169, 1),
            fontSize: 24,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      );
}
