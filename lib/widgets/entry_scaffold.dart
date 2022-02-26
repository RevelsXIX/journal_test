import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';

class EntryScaffold extends StatefulWidget {

  final dynamic title;
  final dynamic body;
  final dynamic endDrawer;
  
  final darkMode;
  final toggleTheme;

  const EntryScaffold({Key? key, this.title, this.body, this.endDrawer, 
    this.darkMode, this.toggleTheme}) : super(key: key);

  @override
  _EntryScaffoldState createState() => _EntryScaffoldState();
}

class _EntryScaffoldState extends State<EntryScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Entry'),
      endDrawer: entryEndDrawer(context),
      body: Column(
        children: [
          TitleContainer(context),
          BodyContainer(context)
        ],
      ),
    );
  }

  Widget TitleContainer(BuildContext context) {
    return Placeholder();
  }


  Widget BodyContainer(BuildContext context) {
    return Placeholder();
  }

  Widget entryEndDrawer(BuildContext context) {
    return Drawer(
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

    );
  }

}
