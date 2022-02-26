import 'package:flutter/material.dart';

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
        child: ListView(
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