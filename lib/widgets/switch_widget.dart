import 'package:flutter/material.dart';
import 'package:journal_test/models/custom_themes.dart';

class CustomSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);


    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: () {}
    );
  }
}