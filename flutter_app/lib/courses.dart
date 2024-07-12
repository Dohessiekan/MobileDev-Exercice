import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  // Import du package Bloc
import 'blocs/courses_bloc.dart';  // Import de la classe CoursesBloc
import 'blocs/courses_state.dart';  // Import de la classe CoursesState
import 'models/courses_model.dart';  // Import du modèle Course
import 'detailcourse.dart';  // Import de la page de détails du cours

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  
  get course => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303384), // Set the background color of the entire page
      body: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) {
          if (state is CoursesLoading) {
            return Center(child: CircularProgressIndicator());  // Show loading spinner
          } else if (state is CoursesLoaded) {
            return Stack(
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
                                      for (var course in state.courses)  // Loop through the courses from the state
                                        CourseCard(
                                          title: course.name,
                                          subtitle: '${course.chapters.length} chapters',
                                          hours: '${course.duration}h',
                                          imagePath: course.imagePath,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Detailcourse(course: course, courses_model: null,), // Pass the course data to the Detailcourse page
                                              ),
                                            );
                                          },
                                        ),
                                      SizedBox(height: 15), // Space between course cards
                                      if (state.courses.isEmpty)  // Show a message if there are no courses
                                        Text(
                                          'No courses available',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Ubuntu',
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
                                      CourseCard(
                                        title: '3D Animation',
                                        subtitle: '3 chapters',
                                        hours: '15h',
                                        imagePath: 'assets/group1.png',
                                        showRating: false, // Do not show the rating for the ongoing course
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Detailcourse(course: course, courses_model: null,), // Pass the course data to the Detailcourse page
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
                    ),
                  ],
                ),
              ],
            );
          } else if (state is CoursesError) {
            return Center(child: Text('Failed to load courses'));  // Show error message
          } else {
            return Center(child: Text('Unexpected error'));  // Default error message
          }
        },
      ),
    );
  }
}

// CourseCard widget definition
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
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the card
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color and opacity
              spreadRadius: 2, // Shadow spread radius
              blurRadius: 5, // Shadow blur radius
              offset: Offset(0, 3), // Shadow offset
            ),
          ],
        ),
        child: Row(
          children: [
            // Course image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10), // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
                mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                children: [
                  Text(
                    title,  // Course title
                    style: TextStyle(
                      color: Color(0xFF303384), // Text color
                      fontSize: 16, // Text size
                      fontFamily: 'Ubuntu', // Font family
                      fontWeight: FontWeight.bold, // Font weight
                    ),
                  ),
                  SizedBox(height: 5), // Space between title and subtitle
                  Text(
                    subtitle,  // Course subtitle
                    style: TextStyle(
                      color: Color(0xFF999999), // Text color
                      fontSize: 14, // Text size
                      fontFamily: 'Ubuntu', // Font family
                    ),
                  ),
                  SizedBox(height: 5), // Space between subtitle and hours
                  Text(
                    hours,  // Course hours
                    style: TextStyle(
                      color: Color(0xFF999999), // Text color
                      fontSize: 14, // Text size
                      fontFamily: 'Ubuntu', // Font family
                    ),
                  ),
                  if (showRating) ...[
                    SizedBox(height: 5), // Space between hours and rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),  // Rating star icon
                        Icon(Icons.star, color: Colors.yellow, size: 16),  // Rating star icon
                        Icon(Icons.star, color: Colors.yellow, size: 16),  // Rating star icon
                        Icon(Icons.star, color: Colors.yellow, size: 16),  // Rating star icon
                        Icon(Icons.star_border, color: Colors.yellow, size: 16),  // Empty star icon
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
