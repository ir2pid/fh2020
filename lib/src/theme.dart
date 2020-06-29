import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  String secondary;
  String primary;
  String danger;
  String success;

  AppTheme(this.primary, this.secondary, this.danger, this.success);

  static final ThemeData tdLight = ThemeData.light().copyWith(
    accentColor: constants.blue,
  );
  static final ThemeData tdDark = ThemeData.dark().copyWith(
    accentColor: constants.blue,
  );

  static final ThemeData example = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.grey,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}
