import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_drop_down.dart';


class JournalEntryFields {
  String? title;
  String? body;
  DateTime? dateTime;
  int? rating;
  String toString() {
    return 'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';
  }
}



class JournalEntryForm extends StatefulWidget {

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // const JournalEntryForm({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Padding(padding: const EdgeInsets.all(10),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Title', border: OutlineInputBorder()
            ),
            onSaved: (value) {
              journalEntryFields.title =  value;
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
          Padding(padding: const EdgeInsets.all(10),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'Body', border: OutlineInputBorder()
            ),
            onSaved: (value) {
              // store value or something
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
        Padding(padding: const EdgeInsets.all(10),
          child: CustomDropDownButton()
        ),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                  Navigator.of(context).pop();
                },
                  child: Text('Cancel')
              )
              ),
              Padding(padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                if (formKey.currentState!.validate()){
                  formKey.currentState?.save();
                  // Database.of(context).saveJournalEntry(journalEntryFields);
                  Navigator.of(context).pop();
                }
              },
                  child: Text('Save')
              )
              )
            ],
          )

        ]
      ),
     )
    );
  }
}