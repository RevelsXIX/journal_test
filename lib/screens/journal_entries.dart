import 'package:flutter/material.dart';
import 'package:journal_test/widgets/journal_scaffold.dart';
import 'package:journal_test/widgets/welcome_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:journal_test/models/journal.dart';
import 'new_entry.dart';
import 'package:journal_test/models/journal_entry.dart';

class JournalEntries extends StatefulWidget {

  static const routeName = '/';

  final darkMode;
  final toggleTheme;

  // late Journal journal;


  JournalEntries({Key? key, this.darkMode, this.toggleTheme}) : super(key: key);

  @override
  State<JournalEntries> createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {

  Journal? journal;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final Database database = await openDatabase(
      'journal.db', version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, dateTime TEXT)');
      }
    );
    List<Map> journalRecords = await database.rawQuery('SELECT * FROM journal_entries');
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        dateTime: record['dateTime']);
    }).toList();
    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }


  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return JournalScaffold(
          title: 'Loading',
          child: Center(child: CircularProgressIndicator()),
          endDrawer: entryEndDrawer(context),
      );
    } else {
      return JournalScaffold(
        title: journal!.isEmpty ? 'Welcome' : 'Journal Entries',
        child: journal!.isEmpty ? WelcomeWidget() : journalList(context),
        endDrawer: entryEndDrawer(context),
        fab: addEntryFab(context),
      );
    }
  }

  void createNewEntry() {
    Navigator.of(context).pushNamed(NewEntry.routeName);
  }



Widget journalList (BuildContext context){
  return ListView.builder(
    itemCount: journal!.numberOfEntries,
    itemBuilder: (context, index) {
      return buildEntry(journal!.entries[index]);
    },
  );
}

Widget buildEntry(JournalEntry entry) {
    return ListTile(
      title: Text(entry.title!),
      subtitle: Text(entry.dateTime),
    );
}

Widget addEntryFab(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {createNewEntry();},
        child: Icon(Icons.add)
    );
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
              // onChanged: () {},
            ]
        )

    );
}


}
