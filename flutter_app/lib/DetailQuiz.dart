import 'package:flutter/material.dart';
import 'package:flutter_app/Quizz1.dart'; // Ensure that this file exists
import 'package:get/get.dart';

// The DetailQuiz widget displays detailed information about a specific quiz
class DetailQuiz extends StatefulWidget {
  const DetailQuiz({Key? key}) : super(key: key);

  @override
  _DetailQuizState createState() => _DetailQuizState();  // Creates the state for the DetailQuiz widget
}

class _DetailQuizState extends State<DetailQuiz> {
  int _selectedIndex = 0;  // Variable to keep track of the selected index for navigation

  // Method to handle tab changes or other actions
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected index
    });
    // Actions for each navigation item can be added here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384), // Background color of the screen
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar background
        elevation: 0, // No shadow for the AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white), // User icon for additional actions
            onPressed: () {
              // Action for the right icon (currently just prints a message)
              print('Right icon pressed');
            },
          ),
        ],
        title: Text(
          'Detail Quiz',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false, // Title is not centered
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  // Aligns children widgets to the start of the column
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  // Aligns children widgets to the start of the column
              children: [
                Text(
                  'UI UX Design Quiz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5), // Spacing between the title and the subtitle
                Text(
                  'GET 100 Points',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),  // Top-left corner radius
                  topRight: Radius.circular(20.0),  // Top-right corner radius
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Centers the content horizontally
                  children: [
                    // Blue line at the top of the content
                    Container(
                      height: 5,
                      width: 50,  // Width of the blue line
                      color: Colors.blue,
                    ),
                    SizedBox(height: 20), // Space between the blue line and the text
                    Text(
                      'Brief explanation about this quiz',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center, // Centers the text
                    ),
                    SizedBox(height: 20), // Space between the text and the quiz details
                    // Quiz details section
                    Expanded(
                      child: ListView(
                        children: [
                          DetailRow(
                            icon: Icons.book,
                            title: '10 Questions',
                            subtitle: '10 points for a correct answer',
                          ),
                          DetailRow(
                            icon: Icons.timer,
                            title: '20 min',
                            subtitle: 'Total duration of the quiz',
                          ),
                          DetailRow(
                            icon: Icons.star,
                            title: 'Win 10 star',
                            subtitle: 'Answer all questions correctly',
                          ),
                          SizedBox(height: 20), // Space before the instructions
                          Text(
                            'Please read the text below carefully so you can understand it',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center, // Centers the text
                          ),
                          SizedBox(height: 10), // Space between the text and the instruction list
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,  // Aligns children widgets to the start of the column
                            children: [
                              InstructionText(text: '• 10 points awarded for a correct answer and no marks for an incorrect answer'),
                              InstructionText(text: '• Tap on options to select the correct answer'),
                              InstructionText(text: '• Tap on the bookmark icon to save interesting questions'),
                              InstructionText(text: '• Click submit if you are sure you want to complete all the quizzes'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Button to proceed to the quiz
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const QuizPage()),  // Navigates to the QuizPage
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF013399), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners for the button
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 12.0,
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white, // Text color for the button
                            fontSize: 16,
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

// Custom widget to display a row of quiz details
class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const DetailRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF333333),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(icon, color: Colors.white),  // Icon for the detail row
          ),
          SizedBox(width: 8), // Space between the icon and the text
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\n$subtitle',  // Subtitle text for the detail row
                    style: TextStyle(
                      color: Colors.grey,
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

// Custom widget to display instructional text
class InstructionText extends StatelessWidget {
  final String text;

  const InstructionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

