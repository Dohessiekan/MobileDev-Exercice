import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'courses.dart';
import 'ProfilePage.dart';
import 'detailcourse.dart'; // Import the Detailcourse page

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String username = "Loading...";
  String greetingText = "";
  IconData greetingIcon = Icons.wb_sunny_outlined;

  @override
  void initState() {
    super.initState();
    fetchUsername();
    setGreeting();
  }

  Future<void> fetchUsername() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        setState(() {
          username = userDoc['username'] ?? 'User';
        });
      } else {
        setState(() {
          username = 'User';
        });
      }
    } catch (e) {
      setState(() {
        username = 'Error fetching username';
      });
      print("Error fetching username: $e");
    }
  }

  void setGreeting() {
    final hour = DateTime.now().hour;

    setState(() {
      if (hour >= 5 && hour < 12) {
        greetingText = 'GOOD MORNING';
        greetingIcon = Icons.wb_sunny_outlined;
      } else if (hour >= 12 && hour < 18) {
        greetingText = 'GOOD AFTERNOON';
        greetingIcon = Icons.wb_sunny;
      } else if (hour >= 18 && hour < 21) {
        greetingText = 'GOOD EVENING';
        greetingIcon = Icons.nights_stay;
      } else {
        greetingText = 'GOOD NIGHT';
        greetingIcon = Icons.brightness_2;
      }
    });
  }

  Future<List<DocumentSnapshot>> _fetchPopularCourses() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('courses')
        .where('rating', isGreaterThanOrEqualTo: 3.5)
        .orderBy('rating', descending: true)
        .limit(4) // Increased limit to fetch 4 courses
        .get();

    return querySnapshot.docs;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: AppBar(
          backgroundColor: const Color(0xFF303384),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                greetingIcon,
                                color: Color(0xFFF9B32D),
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                greetingText,
                                style: const TextStyle(
                                  fontFamily: 'Fira Sans',
                                  color: Color(0xFFF9B32D),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            username,
                            style: const TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(164, 30, 15, 99),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'COURSES TO BE ADDED',
                                  style: TextStyle(
                                    fontFamily: 'Fira Sans',
                                    color: Color.fromARGB(158, 255, 255, 255),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.headset,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Classic Music Basics',
                                      style: TextStyle(
                                        fontFamily: 'Fira Sans',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 60),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 215,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(103, 55, 141, 212),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 40.0, right: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'QUOTE OF THE DAY',
                            style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Take part in challenges with friends or other players and have a fun time',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular Courses',
                              style: TextStyle(
                                fontFamily: 'Fira Sans',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            
                          ],
                        ),
                        FutureBuilder<List<DocumentSnapshot>>(
                          future: _fetchPopularCourses(),
                builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error fetching courses'));
                            }

                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(
                                  child: Text('No popular courses found'));
                            }

                            List<DocumentSnapshot> courses = snapshot.data!;

                            return Column(
                              children: [
                                ...courses.map((courseDoc) {
                                  var courseData =
                                      courseDoc.data() as Map<String, dynamic>;
                                  return GestureDetector(
                                    onTap: () => Get.to(() =>
                                        Detailcourse(courseId: courseDoc.id)),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(150, 5, 5, 5)
                                                .withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              courseData['image'] ?? '',
                                              height: 60,
                                              width: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  courseData['title'] ??
                                                      'No Title',
                                                  style: TextStyle(
                                                    fontFamily: 'Fira Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  courseData['subtitle'] ??
                                                      'No Subtitle',
                                                  style: TextStyle(
                                                    fontFamily: 'Fira Sans',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time,
                                                      color: Colors.blue,
                                                      size: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      '${courseData['hours'] ?? 0}',
                                                      style: TextStyle(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      '${courseData['rating'] ?? 0}',
                                                      style: TextStyle(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 12,
                                                        color: Colors.orange,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                SizedBox(
                                    height: 10), // Add a small space at the end
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
