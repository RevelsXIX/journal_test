import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';
// import 'package:journal_test/models/journal.dart';


class JournalScaffold extends StatefulWidget {
  final dynamic title;
  final dynamic child;
  final dynamic fab;

  const JournalScaffold({Key? key, required this.title, required this.child, this.fab}) : super(key: key);

  @override
  _JournalScaffoldState createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: widget.title
      ),
      body: widget.child,
      floatingActionButton: widget.fab,

    );
  }
}
