import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';


class WelcomeScreen extends StatefulWidget {

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
                Icons.book,
                color: Colors.black,
                size: 80.0
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Journal')
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add)
      ),
    );
  }




}