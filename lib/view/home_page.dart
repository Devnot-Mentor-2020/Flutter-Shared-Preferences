import 'package:flutter/material.dart';
import 'package:shared_preferences_theme/core/constants/enums/keys.dart';
import 'package:shared_preferences_theme/core/init/cache/shared_preferences.dart';
import 'package:shared_preferences_theme/core/init/theme/dark_theme.dart';
import 'package:shared_preferences_theme/core/init/theme/light_theme.dart';

class SharedPreferanceTheme extends StatefulWidget {
  @override
  _SharedPreferanceTheme createState() => _SharedPreferanceTheme();
}
 
class _SharedPreferanceTheme extends State<SharedPreferanceTheme> {
  bool themeValue = false;
  getValue()  {
       setState(() {
      themeValue= LocaleManager.instance.getBoolValue(PreferencesKeys.VALUE)?? false;
    });
  }
  @override
  void initState() {
    super.initState();
    getValue();
  }
 
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeValue ? lightTheme : darkTheme,
      child: Scaffold(
        appBar: AppBar(title: Text("Shared Preferances")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("#VEFA", style: TextStyle(fontSize: 35), ),
              Switch(
                value: themeValue,
                onChanged: (value) {
                  setState(() {
                    LocaleManager.instance.setBoolValue(PreferencesKeys.VALUE, value);
                    getValue();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}