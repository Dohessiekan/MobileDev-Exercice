import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/detailcourse.dart'; // Import the course details page

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  String selectedCategory = 'History'; // Default selected category

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
                        'Hello, James', // Greeting message
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
                          SizedBox(height: 15), // Space between section title and the course card
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CourseCard(
                              title: '3D Animation',
                              subtitle: '3 chapters',
                              hours: '15h',
                              image: 'assets/group1.png',
                              showRating: false, // Do not show the rating for the ongoing course
                              onTap: () {
                              },
                            ),
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
              color: isSelected ? Colors.blue : Color(0xFF898989),
              fontSize: 13,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isSelected)
            Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(top: 3), // Add space between text and the dot
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String hours;
  final String image;
  final bool showRating;
  final VoidCallback onTap;

  const CourseCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.hours,
    required this.image,
    this.showRating = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Make the course card as wide as the screen
        height: 90, // Height of the course card
        padding: EdgeInsets.symmetric(horizontal: 15), // Horizontal padding inside the course card
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the course card
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              blurRadius: 5, // Blur radius for the shadow
              offset: Offset(0, 3), // Offset for the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            // Display the course image
            Container(
              width: 60, // Width of the course image
              height: 60, // Height of the course image
              decoration: BoxDecoration(
                color: Colors.blue, // Placeholder color if image is not loaded
                borderRadius: BorderRadius.circular(10), // Rounded corners for the image
                image: DecorationImage(
                  image: NetworkImage(image), // Load image from the network
                  fit: BoxFit.cover, // Fit the image within the container
                ),
              ),
            ),
            SizedBox(width: 15), // Space between the image and the text
            // Display the course details
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
                children: [
                  Text(
                    title, // Course title
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 14, // Text size
                      fontFamily: 'Ubuntu', // Font family
                      fontWeight: FontWeight.bold, // Font weight
                    ),
                  ),
                  Text(
                    subtitle, // Course subtitle
                    style: TextStyle(
                      color: Color(0xFF898989), // Text color
                      fontSize: 12, // Text size
                      fontFamily: 'Ubuntu', // Font family
                      fontWeight: FontWeight.normal, // Font weight
                    ),
                  ),
                  SizedBox(height: 10), // Space between subtitle and the additional information
                  Row(
                    children: [
                      // Display the course duration
                      Icon(Icons.schedule, color: Colors.blue, size: 12), // Clock icon
                      SizedBox(width: 5), // Space between icon and the text
                      Text(
                        hours, // Duration text
                        style: TextStyle(
                          color: Colors.blue, // Text color
                          fontSize: 12, // Text size
                          fontFamily: 'Ubuntu', // Font family
                          fontWeight: FontWeight.normal, // Font weight
                        ),
                      ),
                      // Display rating if showRating is true
                      if (showRating) ...[
                        SizedBox(width: 10), // Space between duration and the rating
                        Icon(Icons.star, color: Colors.orange, size: 12), // Star icon
                        SizedBox(width: 5), // Space between icon and the text
                        Text(
                          '4.8', // Rating text
                          style: TextStyle(
                            color: Colors.orange, // Text color
                            fontSize: 12, // Text size
                            fontFamily: 'Ubuntu', // Font family
                            fontWeight: FontWeight.normal, // Font weight
                          ),
                        ),
                      ],
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
