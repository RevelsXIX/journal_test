
class JournalEntryDTO {
  String? title;
  String? body;
  DateTime? dateTime;
  int? rating;

  @override
  String toString() {
    return 'title: $title, body: $body, rating: $rating, datetime: $dateTime';
  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    'title': title,
    'body': body,
    'rating': rating,
    'dateTime': dateTime
  };
}
