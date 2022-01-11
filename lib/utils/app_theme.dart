import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primarySwatch: Colors.grey,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    bottomAppBarTheme: _bottomAppBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    // textButtonTheme:
  );

  static const _bottomNavigationBarTheme = BottomNavigationBarThemeData(
      selectedItemColor: Colors.black87, unselectedItemColor: Colors.grey);

  static const _bottomAppBarTheme = BottomAppBarTheme(
    color: Colors.white,
    elevation: 1,
  );

  static const _appBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    toolbarHeight: 60,
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize:
          MaterialStateProperty.all<Size>(const Size(double.maxFinite, 60)),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );

  // static const _textButtonTheme = TextButtonThemeData(
  //   style: ButtonStyle(
  //     textStyle:
  //   )
  // );
}
