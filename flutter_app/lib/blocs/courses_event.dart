import 'package:equatable/equatable.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];
}

class FetchCourses extends CoursesEvent {}

class UpdateCourse extends CoursesEvent {
  final String courseId;
  final Map<String, dynamic> updates;

  const UpdateCourse(this.courseId, this.updates);

  @override
  List<Object> get props => [courseId, updates];
}
