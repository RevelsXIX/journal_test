import 'journal_entry.dart';

class Journal {
  final List<JournalEntry> entries;

  Journal({required this.entries});

  bool get isEmpty => entries.isEmpty;
  int get numberOfEntries => entries.length;
  List<JournalEntry> get getEntries => entries;

  void addEntry(JournalEntry){
    entries.add(JournalEntry);
  }

}