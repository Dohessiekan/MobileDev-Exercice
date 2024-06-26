import 'package:flutter/material.dart';
import 'package:flutter_app/coursework.dart';
import 'package:get/get.dart';


class CourseContent extends StatelessWidget {
  const CourseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      appBar: AppBar(
        backgroundColor: const Color(0xFF303384),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'Details Course',
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
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              // Add your profile icon action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        color: Colors.yellow, // Set the star icon color to yellow
                        size: 24.0,
                      ),
                      SizedBox(width: 4), // Add some spacing between the star and the text
                      Text(
                        '4.8',
                        style: TextStyle(
                          color: Colors.white, // Set the color of the text to white
                          fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                          fontSize: 18, // Set the font size to 18
                          fontWeight: FontWeight.w500, // Set the font weight to medium
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add space between the title and the container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0), // Set top left corner radius
                  topRight: Radius.circular(0.0), // Set top right corner radius
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
                        color: Color(0xFF303384), // Set the color to purple
                        fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9B32D), // Set the background color to F9B32D
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303384),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303384),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303384),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Add space between the boxes and the new title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'UI UX Design Defined',
                      style: TextStyle(
                        color: Color(0xFF303384), // Set the color to match the background
                        fontFamily: 'Ubuntu', // Set the font family to Ubuntu
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
                        fontFamily: 'Ubuntu', // Set the font family to Ubuntu
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
                          fontFamily: 'Ubuntu', // Set the font family to Ubuntu
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
                        const Divider(color: Colors.grey, thickness: 1), // Regular grey line above the first title
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Design with the user in mind',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303384), // Set the color to #303384
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: IconButton(
                                  icon: const Icon(Icons.chevron_right, color: Colors.black),
                                  onPressed: ()=>Get.to(()=>const Coursework())
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
                                  fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303384), // Set the color to #303384
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
                                'Consider minor group of users',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303384), // Set the color to #303384
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Add space before the button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF013399), // Background color
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Take the quiz',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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

