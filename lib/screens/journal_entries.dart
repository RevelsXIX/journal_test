import 'package:flutter/material.dart';
import 'package:journal_test/widgets/journal_scaffold.dart';
import 'package:journal_test/widgets/welcome_widget.dart';
import 'new_entry.dart';
import 'package:journal_test/models/journal_entry.dart';
import 'package:journal_test/db/database.dart';
import 'package:journal_test/models/journal.dart';

class JournalEntries extends StatefulWidget {

  static const routeName = 'journal_entries';

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
    Journal throwawayJournal;
    loadJournal();
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<JournalEntry> journalEntries = await databaseManager.journalEntries();
    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }


  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return JournalScaffold(
          title: 'Loading',
          child: Center(child: CircularProgressIndicator())
      );
    } else {
      return JournalScaffold(
        title: journal!.isEmpty ? 'Welcome' : 'Journal Entries',
        child: journal!.isEmpty ? WelcomeWidget() : Placeholder(),
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
      title: Text(entry.title),
      // subtitle: DateTime(entry.dateTime),
    );
}

Widget addEntryFab(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {createNewEntry();},
        child: Icon(Icons.add)
    );
  }


}

