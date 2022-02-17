import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'models/custom_themes.dart';

class App extends StatelessWidget {

  // const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Journal',
        // theme: ThemeData(primarySwatch: Colors.red),
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: WelcomeScreen()
    );
  }
}

