import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 111, 164, 255),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 129, 175, 255),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          centerTitle: false,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.onPrimaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
        ),  
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.onPrimaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer,
          ),
        ), 
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromARGB(255, 88, 138, 223),
          ),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        iconTheme: IconThemeData(
          color: kColorScheme.primaryContainer, // Set the desired icon color

        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          centerTitle: false,
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 136, 180, 255),
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),  
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromARGB(255, 20, 66, 147),
          ),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Color.fromARGB(255, 20, 66, 147),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 20, 66, 147), // Set the desired icon color
          size: 24, // Set the desired icon size
        ),
      ),
      // themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}