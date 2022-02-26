import 'package:flutter/material.dart';
import 'package:journal_test/screens/journal_entries.dart';
import 'package:journal_test/widgets/custom_drop_down.dart';
import 'package:journal_test/db/database.dart';
import 'package:journal_test/models/journal_entry_dto.dart';


class JournalEntryForm extends StatefulWidget {

  const JournalEntryForm({Key? key}) : super(key: key);


  // final Journal journal;

  // JournalEntryForm({Key? key, required this.journal}) : super(key: key);

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // const JournalEntryForm({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();

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
                if (formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  addDateToJournalEntryValues();
                  final databaseManager = DatabaseManager.getInstance();
                  databaseManager.saveJournalEntry(dto: journalEntryValues);
                  Navigator.pushNamed(
                      context,
                      JournalEntries.routeName)
                  .then((entry) => setState(() {}));
                    // Navigator.of(context).pop();
                }
              },

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
    journalEntryValues.dateTime = DateTime.now();
  }


}