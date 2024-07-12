import 'lessons_model.dart';

class Chapter {
  final String id;
  final String title;
  final String description;
  final List<Lesson> lessons;

  Chapter({required this.id, required this.title, required this.description, required this.lessons});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    var lessonsFromJson = json['lessons'] as List;
    List<Lesson> lessonList = lessonsFromJson.map((lesson) => Lesson.fromJson(lesson)).toList();

    return Chapter(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      lessons: lessonList,
    );
  }
}

