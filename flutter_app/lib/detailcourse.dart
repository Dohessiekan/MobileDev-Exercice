import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/course_content.dart'; // Ensure this file contains the CourseContent class
import 'package:get/get.dart';

class Detailcourse extends StatelessWidget {
  final String courseId;

  const Detailcourse({Key? key, required this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF303384),
        appBar: AppBar(
          title: const Text(
            'Details course',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Ubuntu',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color(0xFF303384),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('courses').doc(courseId).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('Course not found'));
            }

            var courseData = snapshot.data!.data() as Map<String, dynamic>;
            String title = courseData['title'] ?? 'Course Title';
            String imageUrl = courseData['image'] ?? 'assets/default_course_image.png';
            String subtitle = courseData['subtitle'] ?? 'Number of chapters';
            String hours = courseData['hours'] ?? 'Course duration';

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 24.0,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Summary of the course:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildCourseDetail(
                          icon: Icons.menu_book,
                          title: subtitle,
                          description: 'Complete the coursework then attempt the quiz.',
                        ),
                        const SizedBox(height: 20),
                        _buildCourseDetail(
                          icon: Icons.access_time,
                          title: hours,
                          description: 'Total duration of the course',
                        ),
                        const SizedBox(height: 20),
                        _buildCourseDetail(
                          icon: Icons.star,
                          title: 'Win 10 stars',
                          description: 'Answer all questions of the quiz correctly',
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => CourseContent()),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9B32D),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('Enroll'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCourseDetail({required IconData icon, required String title, required String description}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF333333),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Ubuntu',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
