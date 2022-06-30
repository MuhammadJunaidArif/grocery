import 'package:flutter/cupertino.dart';

import '../screens/dark_theme_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefes darkThemePrefes = DarkThemePrefes();

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;

    darkThemePrefes.setDarkTheme(value);
    notifyListeners();
  }
}
