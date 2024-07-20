import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'scorepage.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  String? _selectedOption;
  Timer? _timer;
  int _remainingTime = 1200;  // 30 minutes in seconds

  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the main purpose of user experience (UX) design?",
      "options": [
        "To make the product look pretty",
        "To ensure the product is user-friendly",
        "To increase the product’s market value",
        "To improve the product’s technical performance, ensuring the product meets users’ needs and expectations",
        "To create more features for the product"
      ],
      "answer": "To ensure the product is user-friendly"
    },
    {
      "question": "Which tool is used for UI design?",
      "options": [
        "Photoshop",
        "Sketch",
        "Figma",
        "All of the above",
        "None of the above"
      ],
      "answer": "All of the above"
    },
    {
      "question": "What is a wireframe?",
      "options": [
        "A detailed prototype",
        "A low-fidelity layout of a design",
        "A style guide",
        "A user persona",
        "A branding document"
      ],
      "answer": "A low-fidelity layout of a design"
    },
    {
      "question": "Which of these is a principle of UX design?",
      "options": [
        "Aesthetic design",
        "Technical performance",
        "User-centered design",
        "Cost-effectiveness",
        "All of the above"
      ],
      "answer": "User-centered design"
    },
    {
      "question": "What is usability testing?",
      "options": [
        "Testing the aesthetics of a design",
        "Testing the functionality and ease of use",
        "Testing the technical specifications",
        "Testing the marketing strategy",
        "None of the above"
      ],
      "answer": "Testing the functionality and ease of use"
    },
    {
      "question": "Which of the following is a tool for creating wireframes?",
      "options": [
        "Sketch",
        "Photoshop",
        "Illustrator",
        "After Effects",
        "Blender"
      ],
      "answer": "Sketch"
    },
    {
      "question": "What does UI stand for?",
      "options": [
        "User Innovation",
        "User Interface",
        "User Integration",
        "User Intelligence",
        "User Interaction"
      ],
      "answer": "User Interface"
    },
    {
      "question": "What does UX stand for?",
      "options": [
        "User Experience",
        "User Expertise",
        "User Examination",
        "User Execution",
        "User Expansion"
      ],
      "answer": "User Experience"
    },
    {
      "question": "What is the goal of a UX designer?",
      "options": [
        "To create a visually appealing interface",
        "To ensure a seamless and enjoyable user experience",
        "To develop the technical backend",
        "To increase product sales",
        "To implement marketing strategies"
      ],
      "answer": "To ensure a seamless and enjoyable user experience"
    },
    {
      "question": "Which principle focuses on making designs accessible to all users?",
      "options": [
        "Inclusivity",
        "Simplicity",
        "Consistency",
        "Accessibility",
        "Creativity"
      ],
      "answer": "Accessibility"
    }
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
        _submitAnswer('', isLast: true);
      }
    });
  }

  String get timerText {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(48, 51, 132, 1), // Background color for the entire page
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          color: Colors.white, // Icon color
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the title and the timer
          children: [
            const Text(
              'UI UX Design Quiz', // Page title
              style: TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.w500, // Font weight for the title
                fontSize: 24, // Font size for the title
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding inside the container
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the timer container
                borderRadius: BorderRadius.circular(30), // Rounded corners for the container
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer, color: Colors.blue), // Timer icon
                  const SizedBox(width: 5), // Space between the icon and the text
                  Text(
                    timerText, // Timer text
                    style: const TextStyle(color: Colors.blue), // Text color
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(48, 51, 132, 1), // AppBar background color
        iconTheme: const IconThemeData(color: Colors.white), // Icon color in AppBar
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20), // Title text style
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50), // Margin to position the content below the AppBar
          decoration: const BoxDecoration(
            color: Colors.white, // Background color for the content area
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), // Rounded top left corner
              topRight: Radius.circular(30), // Rounded top right corner
            ),
          ),
          width: double.infinity, // Make the container take up full width
          child: Column(
            children: [
              // Separator line at the top of the content
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 60, // Width of the separator line
                  height: 5, // Height of the separator line
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), // Rounded corners for the line
                    gradient: const LinearGradient(
                      colors: [Colors.lightBlue, Colors.blue], // Gradient colors for the line
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between the separator line and the buttons
              // Horizontal scrollable row of buttons representing question numbers
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Horizontal scroll direction
                padding: const EdgeInsets.symmetric(horizontal: 10), // Horizontal padding
                child: Row(
                  children: List.generate(10, (index) {
                    final number = index + 1; // Question number
                    final isCurrent = currentQuestionIndex == index; // Highlight the current question number

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6), // Space between the buttons
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentQuestionIndex = index;
                                _selectedOption = null;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isCurrent ? Colors.orange : const Color.fromRGBO(48, 51, 132, 1), // Button color
                              shape: const CircleBorder(), // Circular button shape
                              padding: EdgeInsets.zero, // No internal padding for the button
                              minimumSize: const Size(45, 45), // Ensures the button is a perfect circle
                            ),
                            child: Center(
                              child: Text(
                                '$number', // Display the question number
                                style: const TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 25, // Font size for the number
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6), // Space between the button and the line
                          Container(
                            width: 50, // Width of the line
                            height: 2, // Height of the line
                            color: isCurrent ? Colors.orange : Colors.transparent, // Line color based on the question number
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10), // Space between the question number row and the divider
              Divider(
                color: Colors.grey[400], // Divider color
                thickness: 1, // Divider thickness
                indent: 20, // Left margin for the divider
                endIndent: 20, // Right margin for the divider
              ),
              const SizedBox(height: 10), // Space between the divider and the question text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal padding for the question text
                child: Text(
                  currentQuestion['question'], // Question text
                  style: const TextStyle(
                    color: Color.fromRGBO(48, 51, 132, 1), // Text color
                    fontSize: 22, // Font size for the question
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ),
              const SizedBox(height: 20), // Space between the question text and the options
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal padding for the options
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align options to the start
                  children: List.generate(currentQuestion['options'].length, (index) {
                    final option = currentQuestion['options'][index];
                    return _buildOptionButton(option, option);
                  }),
                ),
              ),
              const SizedBox(height: 15), // Space between the options and the navigation buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal padding for the navigation buttons
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the buttons
                  children: [
                    ElevatedButton(
                      onPressed: currentQuestionIndex > 0
                          ? () {
                              setState(() {
                                currentQuestionIndex--;
                                _selectedOption = null;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color of the button
                        foregroundColor: Colors.white, // Text color of the button
                        shape: const CircleBorder(), // Circular button shape
                        padding: const EdgeInsets.all(10), // Padding for the button size
                        minimumSize: const Size(40, 40), // Button size
                      ),
                      child: const Icon(Icons.chevron_left, size: 24), // Previous button icon
                    ),
                    ElevatedButton(
                      onPressed: currentQuestionIndex < questions.length - 1
                          ? () {
                              _submitAnswer(currentQuestion['answer']);
                            }
                          : () {
                              _submitAnswer(currentQuestion['answer'], isLast: true);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color of the button
                        foregroundColor: Colors.blue, // Text color of the button
                        side: const BorderSide(color: Colors.blue, width: 2), // Blue border for the button
                        padding: const EdgeInsets.symmetric(vertical: 15), // Vertical padding for the button
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50), // Button width set to 40% of the screen width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Slightly rounded corners
                        ),
                      ),
                      child: Text(
                        currentQuestionIndex < questions.length - 1 ? 'Next' : 'Submit', // Button text
                        style: const TextStyle(
                          fontSize: 22, // Font size for the text
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: currentQuestionIndex < questions.length - 1
                          ? () {
                              setState(() {
                                currentQuestionIndex++;
                                _selectedOption = null;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color of the button
                        foregroundColor: Colors.white, // Text color of the button
                        shape: const CircleBorder(), // Circular button shape
                        padding: const EdgeInsets.all(10), // Padding for the button size
                        minimumSize: const Size(40, 40), // Button size
                      ),
                      child: const Icon(Icons.chevron_right, size: 24), // Next button icon
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build each option button
  Widget _buildOptionButton(String option, String value) {
    final isSelected = _selectedOption == value; // Check if this option is selected
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8), // Vertical margin for spacing between buttons
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedOption = value; // Update the selected option
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300], // Button color based on selection
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners for the button
          ),
        ),
        child: Row(
          children: [
            Flexible(
              child: Text(
                option, // Option text
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black, // Text color based on selection
                  fontSize: 18, // Font size for the option text
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitAnswer(String correctAnswer, {bool isLast = false}) async {
    if (_selectedOption == correctAnswer) {
      setState(() {
        score++;
      });
    }

    if (!isLast) {
      setState(() {
        currentQuestionIndex++;
        _selectedOption = null;
      });
    } else {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('scores').add({
          'userId': user.uid,
          'username': user.displayName ?? 'Anonymous',
          'score': score,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
      Get.to(() => ScorePage(score: score));
    }
  }
}
