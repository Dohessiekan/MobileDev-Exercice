import 'package:flutter/material.dart';
import 'package:flutter_app/detailcourse.dart'; // Import the course details page

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

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
                                  Text(
                                    'Popular', // Category text
                                    style: TextStyle(
                                      color: Color(0xFF999999), // Text color
                                      fontSize: 14, // Text size
                                      fontFamily: 'Ubuntu', // Font family
                                    ),
                                  ),
                                  SizedBox(width: 20), // Space between category texts
                                  Text(
                                    'Science', // Category text
                                    style: TextStyle(
                                      color: Color(0xFF999999), // Text color
                                      fontSize: 14, // Text size
                                      fontFamily: 'Ubuntu', // Font family
                                    ),
                                  ),
                                  SizedBox(width: 20), // Space between category texts
                                  Text(
                                    'Mathematic', // Category text
                                    style: TextStyle(
                                      color: Color(0xFF999999), // Text color
                                      fontSize: 14, // Text size
                                      fontFamily: 'Ubuntu', // Font family
                                    ),
                                  ),
                                  SizedBox(width: 20), // Space between category texts
                                  Column(
                                    children: [
                                      Text(
                                        'Computer', // Selected category text
                                        style: TextStyle(
                                          color: Colors.blue, // Text color for the selected category
                                          fontSize: 14, // Text size
                                          fontFamily: 'Ubuntu', // Font family
                                        ),
                                      ),
                                      Container(
                                        width: 50, // Width of the indicator line
                                        height: 2, // Height of the indicator line
                                        color: Colors.blue, // Color of the indicator line
                                        margin: EdgeInsets.only(top: 2), // Space above the line
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25), // Space between the categories and the course cards
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                // Course cards for different courses
                                CourseCard(
                                  title: 'UI UX Design',
                                  subtitle: '5 chapters',
                                  hours: '20h',
                                  imagePath: 'assets/group1.png',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detailcourse(), // Navigate to the Detailcourse page
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 15), // Space between course cards
                                CourseCard(
                                  title: 'Graphic Design',
                                  subtitle: '5 chapters',
                                  hours: '20h',
                                  imagePath: 'assets/group1.png',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detailcourse(), // Navigate to the Detailcourse page
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 15), // Space between course cards
                                CourseCard(
                                  title: 'Web Development',
                                  subtitle: '8 chapters',
                                  hours: '30h',
                                  imagePath: 'assets/group1.png',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detailcourse(), // Navigate to the Detailcourse page
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 15), // Space between course cards
                                CourseCard(
                                  title: 'Data Science',
                                  subtitle: '6 chapters',
                                  hours: '25h',
                                  imagePath: 'assets/group1.png',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detailcourse(), // Navigate to the Detailcourse page
                                      ),
                                    );
                                  },
                                ),
                              ],
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
                              imagePath: 'assets/group1.png',
                              showRating: false, // Do not show the rating for the ongoing course
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailcourse(), // Navigate to the Detailcourse page
                                  ),
                                );
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

// Widget for displaying individual course cards
class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String hours;
  final String imagePath;
  final bool showRating;
  final VoidCallback onTap;

  const CourseCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.hours,
    required this.imagePath,
    this.showRating = true,
    required this.onTap,  // Callback when the card is tapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,  // Call the onTap function when the card is tapped
      child: Container(
        padding: EdgeInsets.all(10), // Padding inside the card
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the card
          borderRadius: BorderRadius.circular(10), // Rounded corners for the card
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 2, // Shadow spread
              blurRadius: 5, // Shadow blur radius
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath, // Course image
              width: 100, // Image width
              height: 100, // Image height
            ),
            SizedBox(width: 10), // Space between the image and the text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
                children: [
                  Text(
                    title, // Course title
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 14, // Text size
                      fontFamily: 'Ubuntu', // Font family
                      fontWeight: FontWeight.bold, // Font weight
                    ),
                  ),
                  SizedBox(height: 5), // Space between the title and the subtitle
                  Row(
                    children: [
                      Icon(Icons.menu_book, size: 16, color: Color(0xFF999999)), // Icon for chapters
                      SizedBox(width: 5), // Space between the icon and the subtitle
                      Text(
                        subtitle, // Subtitle with chapter count
                        style: TextStyle(
                          color: Color(0xFF999999), // Text color
                          fontSize: 12, // Text size
                          fontFamily: 'Ubuntu', // Font family
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between the subtitle and the hours
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Color(0xFF999999)), // Icon for hours
                      SizedBox(width: 5), // Space between the icon and the hours text
                      Text(
                        hours, // Hours of the course
                        style: TextStyle(
                          color: Color(0xFF999999), // Text color
                          fontSize: 12, // Text size
                          fontFamily: 'Ubuntu', // Font family
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (showRating) // Show the rating if showRating is true
              Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the rating vertically
                children: [
                  Icon(Icons.star, size: 20, color: Colors.yellow), // Rating star icon
                  SizedBox(height: 5), // Space between the icon and the rating text
                  Text(
                    '4.8', // Rating value
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 12, // Text size
                      fontFamily: 'Ubuntu', // Font family
                    ),
                  ),
                ],
              )
            else
              Icon(Icons.delete, size: 20, color: Colors.red), // Delete icon if showRating is false
          ],
        ),
      ),
    );
  }
}
