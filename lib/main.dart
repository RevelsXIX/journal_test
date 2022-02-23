import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();

  // create new theme controller, which will get the currently selected from shared preferences
  // final themeController = ThemeController(prefs);

  runApp(App(preferences: await SharedPreferences.getInstance()));
}