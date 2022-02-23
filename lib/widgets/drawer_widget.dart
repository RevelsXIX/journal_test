import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomDrawer extends StatefulWidget {

  final darkMode;
  final toggleTheme;

  const CustomDrawer({Key? key, this.darkMode, this.toggleTheme}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Text(
                      'Settings'
                  )
              ),
              SwitchListTile(
                  title: Text('Dark Mode'),
                  value: widget.darkMode ?? false,
                  onChanged: widget.toggleTheme ?? false)
                  // onChanged: () {},
            ]
        )
    );
  }
}