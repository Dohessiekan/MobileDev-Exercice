import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'DetailQuiz.dart';
import 'coursework.dart';

class CourseContent extends StatefulWidget {
  final String courseId; // Pass the course ID when navigating to this page

  const CourseContent({Key? key, required this.courseId}) : super(key: key);

  @override
  _CourseContentState createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  int _activeWeek = 0;
  Map<String, dynamic>? _courseData;
  List<Map<String, dynamic>> _weeksContent = [];

  @override
  void initState() {
    super.initState();
    _fetchCourseData();
  }

  Future<void> _fetchCourseData() async {
    try {
      // Fetch course data
      DocumentSnapshot courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(widget.courseId)
          .get();

      if (!courseSnapshot.exists) {
        throw Exception('Course data not found');
      }

      setState(() {
        _courseData = courseSnapshot.data() as Map<String, dynamic>;
      });

      // Fetch coursework data
      QuerySnapshot courseworkSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(widget.courseId)
          .collection('coursework')
          .get();

      List<Map<String, dynamic>> weeks = await Future.wait(courseworkSnapshot.docs.map((weekDoc) async {
        Map<String, dynamic> weekData = weekDoc.data() as Map<String, dynamic>;

        // Fetch chapters data for each week
        QuerySnapshot chaptersSnapshot = await FirebaseFirestore.instance
            .collection('courses')
            .doc(widget.courseId)
            .collection('coursework')
            .doc(weekDoc.id)
            .collection('chapters')
            .get();

        weekData['chapters'] = chaptersSnapshot.docs
            .map((doc) => (doc.data() as Map<String, dynamic>)['title'])
            .toList();

        return weekData;
      }).toList());

      setState(() {
        _weeksContent = weeks;
      });

    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _setActiveWeek(int week) {
    setState(() {
      _activeWeek = week;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_courseData == null || _weeksContent.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFF303384),
        appBar: AppBar(
          backgroundColor: const Color(0xFF303384),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Course Program',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Ubuntu',
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
                // Add your profile icon action here
              },
            ),
          ],
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final activeContent = _weeksContent[_activeWeek];

    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      appBar: AppBar(
        backgroundColor: const Color(0xFF303384),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          _courseData!['title'],
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Ubuntu',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Add your profile icon action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _courseData!['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 24.0,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${_courseData!['rating'] ?? 'N/A'}',
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
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Weeks',
                      style: TextStyle(
                        color: Color(0xFF303384),
                        fontFamily: 'Ubuntu',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(_weeksContent.length, (index) {
                        final isActive = index == _activeWeek;
                        final color = isActive ? Color(0xFFF9B32D) : Color(0xFF303384);
                        return GestureDetector(
                          onTap: () => _setActiveWeek(index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              activeContent['title'],
                              style: const TextStyle(
                                color: Color(0xFF303384),
                                fontFamily: 'Ubuntu',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Text(
                              activeContent['description'],
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: Text(
                                'Chapters',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303384),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(activeContent['chapters'].length, (index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      activeContent['chapters'][index],
                                      style: const TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF303384),
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.chevron_right, color: Colors.black),
                                      onPressed: () => Get.to(() => Coursework()), // Update this line as needed
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          if (_activeWeek == 3)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                              child: Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF013399),
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                                  ),
                                  onPressed: () => Get.to(() => const DetailQuiz()),
                                  child: const Text(
                                    'Take the quiz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
