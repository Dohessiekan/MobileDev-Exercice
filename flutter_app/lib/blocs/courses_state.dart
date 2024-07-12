import 'package:equatable/equatable.dart';
import '../models/courses_model.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesLoading extends CoursesState {}

class CoursesLoaded extends CoursesState {
  final List<Course> courses;

  const CoursesLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

class CoursesUpdated extends CoursesState {
  final String courseId;

  const CoursesUpdated(this.courseId);

  @override
  List<Object> get props => [courseId];
}

class CoursesError extends CoursesState {
  final String message;

  const CoursesError(this.message);

  @override
  List<Object> get props => [message];
}
