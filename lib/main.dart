import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_theme/home_page.dart';
import 'package:shared_preferences_theme/shared_prefs.dart';
import 'package:shared_preferences_theme/theme/blue_dark.dart';
import 'package:shared_preferences_theme/theme/blue_light.dart';
import 'package:shared_preferences_theme/theme/red_dart.dart';
import 'package:shared_preferences_theme/theme/red_light.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeController = ThemeController(prefs);

  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  

  const MyApp({Key key, this.themeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return ThemeControllerProvider(
          controller: themeController,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: buildCurrentTheme(),
            home: MyHomePage(),
          ),
        );
      },
    );
  }
ThemeData buildCurrentTheme() {
    switch (themeController.currentTheme) {
      case "blueDark":
        return myBlueTheme;
      case "redLight":
        return myRedLightTheme;
      case "redDark":
        return myRedTheme;
      case "blueLight":
        default:
        return blueLightTheme;
      
    }
  }
}

