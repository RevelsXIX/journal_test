import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal_test/screens/journal_entries.dart';
import 'package:journal_test/widgets/custom_drop_down.dart';
// import 'package:journal_test/db/database.dart';
import 'package:journal_test/models/journal_entry_dto.dart';
import 'package:sqflite/sqflite.dart';


class JournalEntryForm extends StatefulWidget {

  const JournalEntryForm({Key? key}) : super(key: key);

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // const JournalEntryForm({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();
  // late final Journal journal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Form(
        key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Padding(padding: const EdgeInsets.all(5),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Title', border: OutlineInputBorder()
            ),
            onSaved: (value) {
              journalEntryValues.title = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a title';
              } else {
                return null;
              }
            },
          )
      ),
          Padding(padding: const EdgeInsets.all(5),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'Body', border: OutlineInputBorder()
            ),
            onSaved: (value) {
              journalEntryValues.body = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a body';
              } else {
                return null;
              }
            },
          )
          ),
        Padding(padding: const EdgeInsets.all(5),
          child: CustomDropDownButton(
            onSaved: (value) {
              journalEntryValues.rating = value;
            },
          )
        ),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                  Navigator.of(context).pop();
                },
                  child: Text('Cancel')
              )
              ),
              Padding(padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        addDateToJournalEntryValues();
                        // await deleteDatabase('journal.db');
                        final Database database = await openDatabase(
                          'journal.db', version: 1, onCreate: (Database db, int version) async {
                            await db.execute(
                              'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, dateTime TEXT)');
                        }
                        );
                        await database.transaction((txn) async {
                          await txn.rawInsert('INSERT INTO journal_entries(title, body, rating, dateTime) VALUES(?, ?, ?, ?)',
                          [journalEntryValues.title, journalEntryValues.body, journalEntryValues.rating, journalEntryValues.dateTime]
                          );
                        });
                        await database.close();
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            JournalEntries.routeName,
                                (route) => false);
                            // .then((entry) => setState(() {}));
                      }
                      }
                )
              )
            ],
          )
        ]
      ),
    )
  );
}

  void addDateToJournalEntryValues() {
    var thisDateTime = DateFormat.yMMMd().format(DateTime.now());
    String stringDateTime = thisDateTime.toString();
    journalEntryValues.dateTime = stringDateTime;
  }
}