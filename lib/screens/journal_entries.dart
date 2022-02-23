import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';

class JournalEntries extends StatelessWidget {

  static const routeName = 'journal_entries';

  final darkMode;
  final toggleTheme;



  const JournalEntries({Key? key, this.darkMode, this.toggleTheme}) : super(key: key);


  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries>{


  @override
  Widget build(BuildContext context){
    return Placeholder();
  }
}