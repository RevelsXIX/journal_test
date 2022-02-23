import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome.dart';
import 'screens/new_entry.dart';
import 'screens/journal_entries.dart';

class App extends StatefulWidget {

  static final routes = {
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    NewEntry.routeName: (context) => NewEntry(),
    JournalEntries.routeName: (context) => JournalEntries()


  };


final SharedPreferences preferences;

  App({Key? key, required this.preferences}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  static const darkModeKey = 'darkMode';
  bool get darkMode =>
      widget.preferences.getBool(darkModeKey) ?? false;

  void toggleTheme(bool value) {
    setState(() {
      widget.preferences.setBool(darkModeKey, !darkMode);
    });
  }



  @override
  Widget build(BuildContext context) {

    // static final routes = {
    //   NewEntry.routeName: (context) => NewEntry();
    //
    // };


    return MaterialApp(
        title: 'My Journal',
        // theme: ThemeData(primarySwatch: Colors.red),
        // themeMode: ThemeMode.system,
        theme: darkMode ? ThemeData.dark() : ThemeData.light(),
        // darkTheme: MyThemes.darkTheme,
        home: WelcomeScreen(darkMode: darkMode, toggleTheme: toggleTheme)
    );
  }

}




