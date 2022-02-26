import 'package:sqflite/sqflite.dart';
import 'package:journal_test/models/journal_entry_dto.dart';
import '../models/journal_entry.dart';



class DatabaseManager {

  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_CREATE_SCHEMA = 'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, dateTime TEXT';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, dateTime) VALUES(?, ?, ?, ?)';
  static const SQL_SELECT = 'SELECT * FROM journal_entries';


  static late DatabaseManager _instance;

  final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    // assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME,
    version: 1,
    onCreate: (Database db, int version) async {
      createTables(db, SQL_CREATE_SCHEMA);
    }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({JournalEntryDTO? dto}) {
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT,
        [dto!.title, dto.body, dto.rating, dto.dateTime.toString()]
      );
    });

  }

  Future<List<JournalEntry>> journalEntries() async {
    final journalRecords = await db.rawQuery(SQL_SELECT);
    final journalEntries = journalRecords.map((record) {
        return JournalEntry(
          title: record['title'] as String,
          body: record['body'] as String,
          rating: record['rating'] as int,
          dateTime: DateTime.parse(record['dateTime'] as String));
      }).toList();
    return journalEntries;
  }

}