import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  colorScheme: const ColorScheme.light(),
  scaffoldBackgroundColor: const Color(0xfff1f1f1),
);

ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    colorScheme: const ColorScheme.dark());

class ThemeNotifier extends ChangeNotifier {
  final String key = "dark";
  late SharedPreferences preferences;
  bool? _darkTheme;

  bool get darkTheme => _darkTheme! ;

  // creating constructor
  ThemeNotifier() {
    _darkTheme = true;
  }

  toggleTheme() {
    _darkTheme = !_darkTheme!;
    notifyListeners();
  }
}
