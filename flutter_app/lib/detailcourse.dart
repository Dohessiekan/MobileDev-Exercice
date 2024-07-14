import 'package:flutter/material.dart';
import 'package:flutter_app/course_content.dart'; // Ensure this file contains the CourseContent class
import 'package:get/get.dart';

// The Detailcourse widget displays detailed information about a specific course
class Detailcourse extends StatelessWidget {
  const Detailcourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back navigation event
        Navigator.of(context).pop(true); // Go back to the previous page
        return true; // Allow the pop action
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF303384), // Background color for the entire screen
        appBar: AppBar(
          title: const Text(
            'Details course', // Title of the AppBar
            style: TextStyle(
              color: Colors.white, // Text color for the AppBar title
              fontFamily: 'Ubuntu', // Font family for the AppBar title
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color(0xFF303384), // AppBar background color
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), // Back arrow icon
            onPressed: () {
              // Action when the back button is pressed
              Navigator.of(context).pop(); // Go back to the previous page
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle), // User profile icon
              color: Colors.white,
              onPressed: () {
                // Action for the profile icon (currently no functionality)
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out title and rating
                children: [
                  const Text(
                    'UI UX Design', // Course title
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star, // Star icon for rating
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                      SizedBox(width: 4), // Space between the star icon and rating text
                      Text(
                        '4.8', // Course rating
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
            const SizedBox(height: 16), // Space between the header and the content
            Expanded(
              child: Container(
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
                          image: const DecorationImage(
                            image: AssetImage('assets/ui.PNG'), // Course image
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
                          decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
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
                          children: const [
                            Text(
                              '26 hours 30 min', // Course duration
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(height: 5), // Space between the duration text and description
                            Text(
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
                          decoration: BoxDecoration(
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
                        onPressed: () => Get.to(()), // Navigate to the CourseContent page
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
            ),
          ],
        ),
      ),
    );
  }
}
