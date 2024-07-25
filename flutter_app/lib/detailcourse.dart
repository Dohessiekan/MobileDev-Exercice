import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/course_content.dart'; // Ensure this file contains the CourseContent class
import 'package:get/get.dart';

class Detailcourse extends StatefulWidget {
  final String courseId;

  const Detailcourse({Key? key, required this.courseId}) : super(key: key);

  @override
  _DetailcourseState createState() => _DetailcourseState();
}

class _DetailcourseState extends State<Detailcourse> {
  double currentRating = 0.0;
  bool isEnrolled = false; // Track enrollment status

  @override
  void initState() {
    super.initState();
    _fetchCurrentRating();
    _checkEnrollmentStatus(); // Check enrollment status on initialization
  }

  void _fetchCurrentRating() async {
    DocumentSnapshot courseDoc = await FirebaseFirestore.instance.collection('courses').doc(widget.courseId).get();
    if (courseDoc.exists) {
      setState(() {
        currentRating = courseDoc['rating'] ?? 0.0;
      });
    }
  }

  void _checkEnrollmentStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not logged in
      return;
    }

    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    if (userDoc.exists) {
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      List<dynamic> enrolledCourses = userData?['enrolledCourses'] ?? [];
      setState(() {
        isEnrolled = enrolledCourses.contains(widget.courseId);
      });
    }
  }

  void _submitRating(double rating) async {
    DocumentReference courseRef = FirebaseFirestore.instance.collection('courses').doc(widget.courseId);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot courseDoc = await transaction.get(courseRef);

      if (!courseDoc.exists) {
        throw Exception("Course does not exist!");
      }

      int numberOfRatings = courseDoc['numberOfRatings'] ?? 0;
      double totalRating = courseDoc['totalRating'] ?? 0.0;

      numberOfRatings++;
      totalRating += rating;

      double newRating = totalRating / numberOfRatings;

      transaction.update(courseRef, {
        'numberOfRatings': numberOfRatings,
        'totalRating': totalRating,
        'rating': newRating,
      });

      setState(() {
        currentRating = newRating;
      });
    });
  }

  void _enrollInCourse() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not logged in
      return;
    }

    DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot userDoc = await transaction.get(userRef);

      if (!userDoc.exists) {
        throw Exception("User does not exist!");
      }

      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      List<dynamic> enrolledCourses = userData?['enrolledCourses'] ?? [];

      if (!enrolledCourses.contains(widget.courseId)) {
        enrolledCourses.add(widget.courseId);
      }

      transaction.update(userRef, {
        'enrolledCourses': enrolledCourses,
      });
    }).then((_) {
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Enrollment Confirmation'),
            content: const Text('You have successfully enrolled in this course.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Get.to(() => CourseContent(courseId: widget.courseId)); // Navigate to CourseContent page with courseId
                },
                child: const Text('Continue'),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      // Handle errors
      print('Error enrolling in course: $error');
    });
  }

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
          future: FirebaseFirestore.instance.collection('courses').doc(widget.courseId).get(),
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
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 24.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            currentRating.toStringAsFixed(1),
                            style: const TextStyle(
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
                    child: SingleChildScrollView(
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
                          const SizedBox(height: 20),
                          _buildRatingSection(),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: isEnrolled ? () {
                                Get.to(() => CourseContent(courseId: widget.courseId)); // Navigate to CourseContent page
                              } : _enrollInCourse,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF9B32D),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Text(isEnrolled ? 'Go to Course' : 'Enroll'),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rate this course',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < currentRating ? Icons.star : Icons.star_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                _submitRating(index + 1.0);
              },
            );
          }),
        ),
      ],
    );
  }
}
