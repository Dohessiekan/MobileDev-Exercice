class Lesson {
  final String id;
  final String title;
  final String description;

  Lesson({required this.id, required this.title, required this.description});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
