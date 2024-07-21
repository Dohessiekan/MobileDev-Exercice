import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/detailcourse.dart'; // Import the course details page
import 'package:firebase_auth/firebase_auth.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  String selectedCategory = 'History'; // Default selected category
  String? username; // Variable to hold the username

  @override
  void initState() {
    super.initState();
    // Fetch the username when the widget is initialized
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        username = userDoc.data()?['username'] ?? 'User'; // Default to 'User' if username is not found
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303384), // Set the background color of the entire page
      body: Stack(
        children: [
          ListView(
            children: [
              // Top section with a welcome message
              Container(
                color: Color(0xFF303384), // Background color for the top section
                height: 90, // Height of the top section
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 0.0).copyWith(top: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // Align text to the bottom of the section
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left) of the section
                    children: [
                      Text(
                        'Hello, ${username ?? 'James'}', // Display username if available
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 17, // Text size
                          fontFamily: 'Ubuntu', // Font family
                          fontWeight: FontWeight.normal, // Font weight
                        ),
                      ),
                      Text(
                        'Learn & test your knowledge', // Subtitle text
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 24, // Text size
                          fontFamily: 'Ubuntu', // Font family
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  children: [
                    SizedBox(height: 25), // Add space between the top section and the search bar
                    // Search bar for finding courses
                    Container(
                      width: double.infinity, // Make the search bar as wide as the screen
                      height: 55, // Height of the search bar
                      padding: EdgeInsets.symmetric(horizontal: 15), // Horizontal padding inside the search bar
                      margin: EdgeInsets.symmetric(horizontal: 15), // Horizontal margin outside the search bar
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color of the search bar
                        borderRadius: BorderRadius.circular(35), // Rounded corners
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.blue), // Search icon
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none, // Remove the default border
                                hintText: 'Search', // Placeholder text
                                hintStyle: TextStyle(color: Color(0xFFD4D4D4)), // Placeholder text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25), // Add space between the search bar and the categories section
                    // Categories section
                    Container(
                      width: double.infinity, // Make the container as wide as the screen
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color for the categories section
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35), // Top left corner rounded
                          topRight: Radius.circular(35), // Top right corner rounded
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20), // Space above the category bar
                          Center(
                            child: Container(
                              width: 50, // Width of the category indicator
                              height: 3, // Height of the category indicator
                              decoration: BoxDecoration(
                                color: Colors.blue, // Color of the category indicator
                                borderRadius: BorderRadius.circular(5), // Rounded corners for the indicator
                              ),
                            ),
                          ),
                          SizedBox(height: 15), // Space between the indicator and the categories text
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal, // Horizontal scroll for categories
                              child: Row(
                                children: [
                                  CategoryItem(
                                    category: 'History',
                                    isSelected: selectedCategory == 'History',
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = 'History';
                                      });
                                    },
                                  ),
                                  SizedBox(width: 20), // Space between category texts
                                  CategoryItem(
                                    category: 'Science',
                                    isSelected: selectedCategory == 'Science',
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = 'Science';
                                      });
                                    },
                                  ),
                                  SizedBox(width: 20), // Space between category texts
                                  CategoryItem(
                                    category: 'Mathematics',
                                    isSelected: selectedCategory == 'Mathematics',
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = 'Mathematics';
                                      });
                                    },
                                  ),
                                  SizedBox(width: 20), // Space between category texts
                                  CategoryItem(
                                    category: 'Computer',
                                    isSelected: selectedCategory == 'Computer',
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = 'Computer';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25), // Space between the categories and the course cards
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('courses')
                                  .where('category', isEqualTo: selectedCategory)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(child: CircularProgressIndicator());
                                }
                                final courses = snapshot.data!.docs;
                                return Column(
                                  children: courses
                                      .map((doc) {
                                        final data = doc.data() as Map<String, dynamic>;
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: CourseCard(
                                            title: data['title'],
                                            subtitle: data['subtitle'],
                                            hours: data['hours'],
                                            image: data['image'],
                                            rating: data['rating'], // Fetch the rating from Firestore
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Detailcourse(courseId: doc.id), // Navigate to the Detailcourse page
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      })
                                      .toList(),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 25), // Space to avoid content overflow
                          Align(
                            alignment: Alignment.centerLeft, // Align 'Continue Course' text to the left
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Continue Course', // Section title for ongoing courses
                                style: TextStyle(
                                  color: Colors.blue, // Text color
                                  fontSize: 16, // Text size
                                  fontFamily: 'Ubuntu', // Font family
                                  fontWeight: FontWeight.bold, // Font weight
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15), // Space between section title and the course cards
                          StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: CircularProgressIndicator());
                              }
                              final user = snapshot.data!.data() as Map<String, dynamic>;
                              final enrolledCourses = user['enrolledCourses'] as List<dynamic>? ?? [];

                              if (enrolledCourses.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No courses enrolled yet.',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                );
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Column(
                                  children: enrolledCourses.map((courseId) {
                                    return FutureBuilder<DocumentSnapshot>(
                                      future: FirebaseFirestore.instance.collection('courses').doc(courseId).get(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child: CircularProgressIndicator());
                                        }
                                        final courseData = snapshot.data!.data() as Map<String, dynamic>;
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: CourseCard(
                                            title: courseData['title'],
                                            subtitle: courseData['subtitle'],
                                            hours: courseData['hours'],
                                            image: courseData['image'],
                                            rating: courseData['rating'],
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Detailcourse(courseId: courseId),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 25), // Space to avoid content overflow
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// CategoryItem widget to handle category selection and styling
class CategoryItem extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey, // Change text color based on selection
              fontSize: 16, // Text size
              fontFamily: 'Ubuntu', // Font family
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Change font weight based on selection
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 5), // Margin between text and underline
              width: 20, // Width of the underline
              height: 2, // Height of the underline
              color: Colors.blue, // Color of the underline
            ),
        ],
      ),
    );
  }
}

// CourseCard widget to display each course's details
class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String hours;
  final String image;
  final double rating;
  final VoidCallback onTap;

  const CourseCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.hours,
    required this.image,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Course image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10), // Space between image and text
            // Course details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 5),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 10), // Space between rating and hours
                      Icon(Icons.schedule, color: Colors.blue, size: 14), // Blue icon next to hours
                      SizedBox(width: 5),
                      Text(
                        hours,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.normal,
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
  }
}
