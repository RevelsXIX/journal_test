import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';
import 'package:journal_test/widgets/welcome_widget.dart';
import 'new_entry.dart';

class WelcomeScreen extends StatefulWidget {

  static const routeName = '/';

  final darkMode;
  final toggleTheme;

  const WelcomeScreen({Key? key, this.darkMode, this.toggleTheme}) : super(key: key);


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen>{

  @override
  void initState() {
    super.initState();
    // getUserData();
  }


  _WelcomeScreenState();

  // DocumentSnapshot userData;

  // final DatabaseManager db = DatabaseManager();

  static const String title = "Josh's Journal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: title,
      ),
      endDrawer: Drawer(

          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
            Container(
            height: 100.0,
            child: DrawerHeader(
                child: Text('Settings'),
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0)
            ),
          ),
                SwitchListTile(
                    title: Text('Dark Mode'),
                    value: widget.darkMode,
                    onChanged: widget.toggleTheme)
                // onChanged: () {},
              ]
          )
      ),
      body: WelcomeWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {createNewEntry();},
        child: Icon(Icons.add)
      ),
    );
  } // Build


  void createNewEntry() {
    Navigator.of(context).pushNamed(NewEntry.routeName);
  }



}