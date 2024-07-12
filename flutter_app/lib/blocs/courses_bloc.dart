import 'package:flutter_bloc/flutter_bloc.dart';
import 'courses_event.dart';
import 'courses_state.dart';
import '../repositories/courses_repository.dart';
import '../models/courses_model.dart'; // Assurez-vous d'importer votre modèle Course
 
class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CoursesRepository _repository;

  CoursesBloc(this._repository) : super(CoursesLoading());

  @override
  Stream<CoursesState> mapEventToState(CoursesEvent event) async* {
    if (event is FetchCourses) {
      yield* _mapFetchCoursesToState();
    } else if (event is UpdateCourse) {
      yield* _mapUpdateCourseToState(event);
    }
  }

  Stream<CoursesState> _mapFetchCoursesToState() async* {
    try {
      final dynamicCourses = await _repository.getCourses();
      final courses = dynamicCourses.map((e) => Course.fromJson(e)).toList();
      yield CoursesLoaded(courses);
    } catch (e) {
      yield CoursesError(e.toString());
    }
  }

  Stream<CoursesState> _mapUpdateCourseToState(UpdateCourse event) async* {
    try {
      await _repository.updateCourse(event.courseId, event.updates);
      yield CoursesUpdated(event.courseId);
    } catch (e) {
      yield CoursesError(e.toString());
    }
  }
}
