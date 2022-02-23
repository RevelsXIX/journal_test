import 'package:flutter/material.dart';

class JournalEntryForm extends StatefulWidget {

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // const JournalEntryForm({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

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
              // store value or something
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
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'Rating', border: OutlineInputBorder()
            ),
            onSaved: (value) {
              // store value or something
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a rating';
              } else {
                return null;
              }
            },
          )
        ),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                if (formKey.currentState!.validate()){
                  formKey.currentState?.save();
                  Navigator.of(context).pop();
                }
              },
                  child: Text('Cancel')
              )
              ),
              Padding(padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                if (formKey.currentState!.validate()){
                  formKey.currentState?.save();
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