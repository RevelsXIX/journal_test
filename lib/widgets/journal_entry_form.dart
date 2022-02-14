import 'package:flutter/material.dart';

class JournalEntryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Title', border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          RaisedButton(onPressed: () {},
              child: Text('Save Entry')
          )
        ]
      ),
    );
  }
}