import 'package:flutter/material.dart';
import 'package:shared_preferences_theme/shared_prefs.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('theme switcher'),
      ),
      bottomNavigationBar: BottomAppBar(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: (){
                ThemeController.of(context).setTheme("redDark");},
                color: Colors.redAccent, 
                child: Text("Dark"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)) ),
            RaisedButton(
              onPressed: (){ThemeController.of(context).setTheme("blueLight");},
              color: Colors.blue, 
              child: Text("Light"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
            RaisedButton(
              onPressed: (){ThemeController.of(context).setTheme("blueDark");},
              color: Colors.blue, child: Text("Dark"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
            RaisedButton(
              onPressed: (){ThemeController.of(context).setTheme("redLight");},
              color: Colors.redAccent, child: Text("Light"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
          ],
        ),
      ),
      
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("#Vefa ",style: TextStyle(fontSize: 55),)
            ],
          ),
        ),
      ),
    );
  }
    
}

