import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';
import 'package:journal_test/widgets/journal_entry_form.dart';

class NewEntry extends StatefulWidget {

  static const routeName = 'new_entry';

  final darkMode;
  final toggleTheme;

  const NewEntry({Key? key, this.darkMode, this.toggleTheme}) : super(key: key);


  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry>{

  static const String title = "New Entry";


  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: CustomAppBar(
          text: title
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
                ]
            )
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JournalEntryForm()
              ],
            )
        ),
      );
    }
  }