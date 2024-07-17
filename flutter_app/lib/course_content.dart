import 'package:flutter/material.dart';
import 'package:flutter_app/models/courses_model.dart';
import 'package:get/get.dart';
import 'DetailQuiz.dart';
import 'course_content.dart';
import 'courses.dart';
import 'coursework.dart';

class CourseContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      appBar: AppBar(
        backgroundColor: const Color(0xFF303384),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        title: Row(
          children: const [
            Text(
              'Course Program',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white), // White profile icon
            onPressed: () {
              // Add your profile icon action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Add the padding and the row for the title and star rating
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'UI UX Design',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow, // Yellow star icon
                      size: 24.0,
                    ),
                    SizedBox(width: 4), // Spacing between the star and the text
                    Text(
                      '4.8',
                      style: TextStyle(
                        color: Colors.white, // White text color
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
          const SizedBox(height: 20), // Space between the title and the container

          // Add the white container
          Expanded(
            child: SingleChildScrollView( // Make the content of the container scrollable
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0), // Top left corner radius
                    topRight: Radius.circular(0.0), // Top right corner radius
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Week',
                        style: TextStyle(
                          color: Color(0xFF303384), // Purple color for the title
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
                        children: List.generate(4, (index) {
                          // Generate week buttons dynamically
                          final isActive = index == 0; // Only first week is active
                          final color = isActive ? Color(0xFFF9B32D) : Color(0xFF303384);
                          return Container(
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
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 20), // Space between the buttons and the section title
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'UI UX Design Defined',
                        style: TextStyle(
                          color: Color(0xFF303384), // Purple color for the section title
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Adding the new paragraph below the title
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'UI/UX Design is the process of creating user interfaces and experiences that are visually appealing, easy to navigate, and provide a satisfying user experience.',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Adding the new centered title
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'UX Design Principles',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF303384),
                          ),
                        ),
                      ),
                    ),
                    // Adding the new titles separated by lines with padding and buttons for superiority symbols
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(color: Colors.grey, thickness: 1), // Divider line
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Design with the user in mind',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF303384),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.chevron_right, color: Colors.black),
                                    onPressed: () => Get.to(() => const Coursework()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.grey, thickness: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Consider minor group of users',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF303384),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.chevron_right, color: Colors.black),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.grey, thickness: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Accessibility in Design',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF303384),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.chevron_right, color: Colors.black),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.grey, thickness: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Usability Testing',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF303384),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.chevron_right, color: Colors.black),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.grey, thickness: 1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 0), // Space before the button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF013399), // Button background color
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                          ),
                          onPressed: () => Get.to(() => const DetailQuiz()),
                          child: const Text(
                            'Take the quiz',
                            style: TextStyle(
                              color: Colors.white, // Button text color
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
          ),
        ],
      ),
    );
  }
}
