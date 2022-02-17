import 'package:flutter/material.dart';
import 'package:journal_test/widgets/switch_widget.dart';


class CustomDrawer extends StatefulWidget {

  // @override
  // Size get preferredSize => Size.fromHeight(60.0);

  // CustomAppBar(
  //     {required this.text});
  // final String text;

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
        children: [
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Text("Settings")
            ),
          ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                'Dark Mode'
              ),
              CustomSwitch()
            ],
          )
          )
        ],
      ),
    );
  }
}