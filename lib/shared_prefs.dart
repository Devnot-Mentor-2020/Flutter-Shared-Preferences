import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_theme/local_keys_enum.dart';


class ThemeController extends ChangeNotifier { 

  ThemeController(this._prefs) {
    _currentTheme = _prefs.getString(PreferencesKeys.THEME.toString()) ?? "blueLight";
    
  }

  final SharedPreferences _prefs;
  String _currentTheme;

  String get currentTheme => _currentTheme.toString();

  void setTheme(String theme) {
    _currentTheme = theme;

    notifyListeners();

    _prefs.setString(PreferencesKeys.THEME.toString(), theme);
  }

  static ThemeController of(BuildContext context) {
    final provider =context.dependOnInheritedWidgetOfExactType<ThemeControllerProvider>();
          
    return provider.controller;
  }
}

class ThemeControllerProvider extends InheritedWidget {
  const ThemeControllerProvider({Key key, this.controller, Widget child})
      : super(key: key, child: child);

  final ThemeController controller;

  @override
  bool updateShouldNotify(ThemeControllerProvider old) =>
      controller != old.controller;
}