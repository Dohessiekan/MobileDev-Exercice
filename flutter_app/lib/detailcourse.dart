import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/course_content.dart'; // Ensure this file contains the CourseContent class
import 'package:flutter_app/models/courses_model.dart'; // Import your Course model
import 'package:get/get.dart';

class Detailcourse extends StatelessWidget {
  final String courseId;

  const Detailcourse({Key? key, required this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy course data for demonstration
    final Course course = Course(
      id: '1',
      name: 'UI UX Design',
      description: 'A comprehensive course on UI/UX Design.',
      chapters: [],
      duration: '26 hours 30 min',
      rating: 4.8,
      imageUrl: 'assets/ui.PNG',
    );

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
<<<<<<< HEAD
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out title and rating
                  children: [
                    Text(
                      course.name, // Course title
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star, // Star icon for rating
                          color: Colors.yellow,
                          size: 24.0,
                        ),
                        const SizedBox(width: 4), // Space between the star icon and rating text
                        Text(
                          course.rating.toString(), // Course rating
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
=======
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
>>>>>>> 8df7ff068c3d5fbfa35a2672db9f33c000c1162d
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD
                  ],
                ),
              ),
              const SizedBox(height: 16), // Space between the header and the content
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // Background color of the content container
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),  // Rounded corners for the top-left
                    topRight: Radius.circular(16.0),  // Rounded corners for the top-right
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start of the column
                  children: [
                    Container(
                      alignment: Alignment.center, // Center align the line
                      child: Container(
                        width: 80, // Width of the line
                        height: 4, // Height of the line
                        decoration: BoxDecoration(
                          color: Colors.blue, // Color of the line
                          borderRadius: BorderRadius.circular(2), // Rounded corners for the line
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Space between the line and the course image
                    Center(
                      child: Container(
                        width: 400, // Width of the course image
                        height: 250, // Height of the course image
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16), // Rounded corners for the image container
                          image: DecorationImage(
                            image: AssetImage(course.imageUrl), // Course image
                            fit: BoxFit.cover, // Cover the container
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Space between the image and the summary text
                    const Text(
                      'Summary of the course:', // Summary section header
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    const SizedBox(height: 10), // Space between the summary text and the details
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF333333), // Icon background color
                            shape: BoxShape.circle, // Circular icon background
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.menu_book, // Icon for chapters
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10), // Space between the icon and the text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                          children: const [
                            Text(
                              '10 chapters', // Number of chapters
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(height: 5), // Space between the chapter text and description
                            Text(
                              'Complete the coursework then attempt the quiz.', // Course completion requirement
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Space between details
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF333333), // Icon background color
                            shape: BoxShape.circle, // Circular icon background
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.access_time, // Icon for course duration
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10), // Space between the icon and the text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                          children: [
                            Text(
                              course.duration, // Course duration
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            const SizedBox(height: 5), // Space between the duration text and description
                            const Text(
                              'Total duration of the course', // Description for course duration
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Space between details
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF333333), // Icon background color
                            shape: BoxShape.circle, // Circular icon background
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.star, // Icon for rewards
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10), // Space between the icon and the text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                          children: const [
                            Text(
                              'Win 10 star', // Reward for the course
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(height: 5), // Space between the reward text and description
                            Text(
                              'Answer all questions of the quiz correctly', // Description for the reward
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40), // Space before the enroll button
                    Center(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => CourseContent(course: course)), // Navigate to the CourseContent page with course parameter
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF9B32D), // Button background color
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Enroll'), // Button text
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
=======
                  ),
                ),
              ],
            );
          },
>>>>>>> 8df7ff068c3d5fbfa35a2672db9f33c000c1162d
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
