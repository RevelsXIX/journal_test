import 'package:flutter/material.dart';

class JournalEntriesScreen extends StatelessWidget {

  static const routeKey = 'journal_entries'

  final items = List<Map>.generate(10000, (i) {
    return {
    'title': 'Journal Entry $i',
    'subtitle': 'Subtitle text for $i',
    };
  });

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: 'Journal Entries',
      child: ListView(
        children: [
          ListTile(
            leading: FlutterLogo(),
            trailing: Icon(Icons.more_horiz),
            title: Text('Journal Entry N'),
            subtitle: Text('Example'),
          )
        ],
      )
    )





  }

}