import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/courses_model.dart';

class CoursesRepository {
  final String baseUrl = 'https://example.com/courses';
  final Duration timeoutDuration = Duration(seconds: 10);

  Future<List> getCourses() async {
    try {
      final response = await http.get(Uri.parse(baseUrl)).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((course) => Course.fromJson(course)).toList();
      } else {
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // Handle specific HTTP client errors
      print('ClientException: $e');
      throw Exception('Failed to load courses: Network error');
    } on TimeoutException catch (e) {
      // Handle timeout errors
      print('TimeoutException: $e');
      throw Exception('Failed to load courses: Request timed out');
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      throw Exception('Failed to load courses: $e');
    }
  }

  Future<void> updateCourse(String courseId, Map<String, dynamic> updates) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$courseId'),
        body: jsonEncode(updates),
        headers: {'Content-Type': 'application/json'},
      ).timeout(timeoutDuration);

      if (response.statusCode != 200) {
        throw Exception('Failed to update course: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // Handle specific HTTP client errors
      print('ClientException: $e');
      throw Exception('Failed to update course: Network error');
    } on TimeoutException catch (e) {
      // Handle timeout errors
      print('TimeoutException: $e');
      throw Exception('Failed to update course: Request timed out');
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      throw Exception('Failed to update course: $e');
    }
  }
}
