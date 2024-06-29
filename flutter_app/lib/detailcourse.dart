import 'package:flutter/material.dart';
import 'package:flutter_app/course_content.dart';
import 'package:get/get.dart';

class Detailcourse extends StatelessWidget {
  const Detailcourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white, // Set the color of the icon to white
          onPressed: () {
            // Add your back button action here
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Details course',
          style: TextStyle(
            color: Colors.white, // Set the color of the text to white
            fontFamily: 'Ubuntu', // Set the font family to Ubuntu
            fontSize: 18,
            fontWeight: FontWeight.w500, // Set the font weight to medium
          ),
        ),
        backgroundColor: const Color(0xFF303384), // Set the AppBar color
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.white, // Set the color of the icon to white
            onPressed: () {
              // Add your profile icon action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Add some padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'UI UX Design',
                    style: TextStyle(
                      color: Colors.white, // Set the color of the text to white
                      fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                      fontSize: 24, // Set the font size to 24
                      fontWeight: FontWeight.w500, // Set the font weight to medium
                    ),
                  ),
                  Row(
                    children: const [
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
            const SizedBox(height: 16), // Add space between the title and the container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Set the background color to white
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0), // Set top left corner radius
                  topRight: Radius.circular(16.0), // Set top right corner radius
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 80, // Set the width of the blue line
                      height: 4, // Set the height of the blue line
                      decoration: BoxDecoration(
                        color: Colors.blue, // Set the color of the blue line
                        borderRadius: BorderRadius.circular(2), // Set the border radius
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between the blue line and the image container
                  Container(
                    width: 400, // Set the width of the image container
                    height: 250, // Set the height of the image container
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color
                      borderRadius: BorderRadius.circular(16), // Set the border radius
                      image: const DecorationImage(
                        image: AssetImage('assets/ui.PNG'), // Set the image asset
                        fit: BoxFit.cover, // Set the fit property
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between the image container and the title
                  const Text(
                    'Summary of the course:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // Set font weight to bold
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  const SizedBox(height: 10), // Space between the title and the book icon row
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF333333), // Set the background color to #333333
                          shape: BoxShape.circle, // Make the container circular
                        ),
                        padding: const EdgeInsets.all(8), // Add padding inside the circle
                        child: const Icon(
                          Icons.menu_book, // Change the icon to a book icon
                          color: Colors.white, // Set the color of the icon to white
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the icon and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '10 chapters',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Set font weight to bold
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          SizedBox(height: 5), // Space between the title and the subtitle
                          Text(
                            'Complete the coursework then attempt the quiz.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey, // Set the color of the subtitle to grey
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between the first icon row and the second icon row
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF333333), // Set the background color to #333333
                          shape: BoxShape.circle, // Make the container circular
                        ),
                        padding: const EdgeInsets.all(8), // Add padding inside the circle
                        child: const Icon(
                          Icons.access_time, // Change the icon to a clock icon
                          color: Colors.white, // Set the color of the icon to white
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the icon and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '26 hours 30 min',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Set font weight to bold
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          SizedBox(height: 5), // Space between the title and the subtitle
                          Text(
                            'Total duration of the course',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey, // Set the color of the subtitle to grey
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between the second icon row and the third icon row
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF333333), // Set the background color to #333333
                          shape: BoxShape.circle, // Make the container circular
                        ),
                        padding: const EdgeInsets.all(8), // Add padding inside the circle
                        child: const Icon(
                          Icons.star, // Change the icon to a star icon
                          color: Colors.white, // Set the color of the icon to white
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the icon and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Win 10 star',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Set font weight to bold
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          SizedBox(height: 5), // Space between the title and the subtitle
                          Text(
                            'Answer all questions of the quiz correctly',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey, // Set the color of the subtitle to grey
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between the third icon row and the button
                  Center(
                    child: ElevatedButton(
                      onPressed: ()=>Get.to(()=>const CourseContent()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF9B32D), // Set the background color to #F9B32D
                        foregroundColor: Colors.white, // Set the text color to white
                        padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 12), // Add padding
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Enroll'),
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

