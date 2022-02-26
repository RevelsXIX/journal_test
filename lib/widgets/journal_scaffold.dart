import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';

class JournalScaffold extends StatefulWidget {

  final dynamic title;
  final dynamic child;
  final dynamic fab;
  final dynamic endDrawer;


  const JournalScaffold({Key? key, required this.endDrawer,
    required this.title, required this.child, this.fab }) : super(key: key);


  @override
  _JournalScaffoldState createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {

  _JournalScaffoldState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: widget.title
      ),
      endDrawer: widget.endDrawer,
      body: widget.child,
      floatingActionButton: widget.fab,

    );
  }
}
