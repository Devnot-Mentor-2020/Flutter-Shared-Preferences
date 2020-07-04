import 'package:flutter/material.dart';
import 'package:shared_preferences_theme/core/init/cache/shared_preferences.dart';
import 'package:shared_preferences_theme/view/home_page.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
  runApp(MyApp());}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharedPreferanceTheme(),
    );
  }
}
 