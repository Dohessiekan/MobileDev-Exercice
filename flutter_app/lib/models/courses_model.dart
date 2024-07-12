import 'chapters_model.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final List<Chapter> chapters;

  Course({required this.id, required this.name, required this.description, required this.chapters});

  factory Course.fromJson(Map<String, dynamic> json) {
    var chaptersFromJson = json['chapters'] as List;
    List<Chapter> chapterList = chaptersFromJson.map((chapter) => Chapter.fromJson(chapter)).toList();

    return Course(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      chapters: chapterList,
    );
  }

  get duration => null;

  get imagePath => null;

  get rating => null;
}
