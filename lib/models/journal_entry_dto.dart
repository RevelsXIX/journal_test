
class JournalEntryDTO {
  String? title;
  String? body;
  String? dateTime;
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
