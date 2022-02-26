
class JournalEntry {
  late String? title;
  late String? body;
  late int? rating;
  late String dateTime;

  JournalEntry({
    this.title,
    this.body,
    this.rating,
    required this.dateTime,
  });

}