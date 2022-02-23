import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';

class NewEntry extends StatefulWidget {

  static const routeName = '/new_entry';

  final darkMode;
  final toggleTheme;

  const NewEntry({Key? key, this.darkMode, this.toggleTheme}) : super(key: key);


  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry>{


  @override
  Widget build(BuildContext context){
    return Placeholder();
  }
}