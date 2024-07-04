import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'scorepage.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Variable to keep track of the selected option
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),  // Background color for the entire page
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),  // Back arrow icon
          color: Colors.white,  // Icon color
          onPressed: () {
            Navigator.pop(context);  // Navigate back to the previous page
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between the title and the timer
          children: [
            Text(
              'UI UX Design Quiz',  // Page title
              style: TextStyle(
                color: Colors.white,  // Text color
                fontWeight: FontWeight.w500,  // Font weight for the title
                fontSize: 24,  // Font size for the title
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),  // Padding inside the container
              decoration: BoxDecoration(
                color: Colors.white,  // Background color of the timer container
                borderRadius: BorderRadius.circular(30),  // Rounded corners for the container
              ),
              child: Row(
                children: [
                  Icon(Icons.timer, color: Colors.blue),  // Timer icon
                  SizedBox(width: 5),  // Space between the icon and the text
                  Text(
                    '00:30',  // Timer text
                    style: TextStyle(color: Colors.blue),  // Text color
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(48, 51, 132, 1),  // AppBar background color
        iconTheme: IconThemeData(color: Colors.white),  // Icon color in AppBar
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),  // Title text style
      ),
      body: SingleChildScrollView(
        // Make the whole body scrollable
        child: Container(
          margin: EdgeInsets.only(top: 50),  // Margin to position the content below the AppBar
          decoration: BoxDecoration(
            color: Colors.white,  // Background color for the content area
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),  // Rounded top left corner
              topRight: Radius.circular(30),  // Rounded top right corner
            ),
          ),
          width: double.infinity,  // Make the container take up full width
          child: Column(
            children: [
              // Separator line at the top of the content
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 60,  // Width of the separator line
                  height: 5,  // Height of the separator line
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),  // Rounded corners for the line
                    gradient: LinearGradient(
                      colors: [Colors.lightBlue, Colors.blue],  // Gradient colors for the line
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),  // Space between the separator line and the buttons
              // Horizontal scrollable row of buttons representing question numbers
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,  // Horizontal scroll direction
                padding: EdgeInsets.symmetric(horizontal: 10),  // Horizontal padding
                child: Row(
                  children: List.generate(10, (index) {
                    final number = index + 1;  // Question number
                    final isOrange = number == 5;  // Highlight the 5th question number

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),  // Space between the buttons
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isOrange ? Colors.orange : Color.fromRGBO(48, 51, 132, 1),  // Button color
                              shape: CircleBorder(),  // Circular button shape
                              padding: EdgeInsets.zero,  // No internal padding for the button
                              minimumSize: Size(45, 45),  // Ensures the button is a perfect circle
                            ),
                            child: Center(
                              child: Text(
                                '$number',  // Display the question number
                                style: TextStyle(
                                  color: Colors.white,  // Text color
                                  fontSize: 25,  // Font size for the number
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),  // Space between the button and the line
                          Container(
                            width: 50,  // Width of the line
                            height: 2,  // Height of the line
                            color: isOrange ? Colors.orange : Colors.transparent,  // Line color based on the question number
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 10),  // Space between the question number row and the divider
              Divider(
                color: Colors.grey[400],  // Divider color
                thickness: 1,  // Divider thickness
                indent: 20,  // Left margin for the divider
                endIndent: 20,  // Right margin for the divider
              ),
              SizedBox(height: 10),  // Space between the divider and the question text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),  // Horizontal padding for the question text
                child: Text(
                  'What is the main purpose of user experience (UX) design?',  // Question text
                  style: TextStyle(
                    color: Color.fromRGBO(48, 51, 132, 1),  // Text color
                    fontSize: 22,  // Font size for the question
                    fontWeight: FontWeight.bold,  // Bold text
                  ),
                  textAlign: TextAlign.center,  // Center the text
                ),
              ),
              SizedBox(height: 20),  // Space between the question text and the options
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),  // Horizontal padding for the options
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  // Align options to the start
                  children: [
                    _buildOptionButton('A', 'To make the product look pretty', 'A'),  // Option A
                    _buildOptionButton('B', 'To ensure the product is user-friendly', 'B'),  // Option B
                    _buildOptionButton('C', 'To increase the product’s market value', 'C'),  // Option C
                    _buildOptionButton('D', 'To improve the product’s technical performance, ensuring the product meets users’ needs and expectations', 'D'),  // Option D
                    _buildOptionButton('E', 'To create more features for the product', 'E'),  // Option E
                  ],
                ),
              ),
              SizedBox(height: 15),  // Space between the options and the navigation buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),  // Horizontal padding for the navigation buttons
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between the buttons
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action to be performed when the "Previous" button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Background color of the button
                        foregroundColor: Colors.white,  // Text color of the button
                        shape: CircleBorder(),  // Circular button shape
                        padding: EdgeInsets.all(10),  // Padding for the button size
                        minimumSize: Size(40, 40),  // Button size
                      ),
                      child: Icon(Icons.chevron_left, size: 24),  // Previous button icon
                    ),
                    ElevatedButton(
                      onPressed: ()=>Get.to(()=>const ScorePage()),  // Navigate to the ScorePage when the button is pressed
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,  // Background color of the button
                        foregroundColor: Colors.blue,  // Text color of the button
                        side: BorderSide(color: Colors.blue, width: 2),  // Blue border for the button
                        padding: EdgeInsets.symmetric(vertical: 15),  // Vertical padding for the button
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),  // Button width set to 40% of the screen width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),  // Slightly rounded corners
                        ),
                      ),
                      child: Text(
                        'Next',  // Button text
                        style: TextStyle(
                          fontSize: 22,  // Font size for the text
                          fontWeight: FontWeight.bold,  // Bold text
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action to be performed when the "Next" button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Background color of the button
                        foregroundColor: Colors.white,  // Text color of the button
                        shape: CircleBorder(),  // Circular button shape
                        padding: EdgeInsets.all(10),  // Padding for the button size
                        minimumSize: Size(40, 40),  // Button size
                      ),
                      child: Icon(Icons.chevron_right, size: 24),  // Next button icon
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),  // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build each option button
  Widget _buildOptionButton(String option, String answer, String value) {
    final isSelected = _selectedOption == value;  // Check if this option is selected
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),  // Vertical margin for spacing between buttons
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedOption = value;  // Update the selected option
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300],  // Button color based on selection
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),  // Button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),  // Rounded corners for the button
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,  // Align text to the start
          children: [
            Text(
              option,  // Option letter (A, B, C, etc.)
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,  // Text color based on selection
                fontSize: 18,  // Font size for the option letter
                fontWeight: FontWeight.bold,  // Bold text
              ),
            ),
            SizedBox(width: 10),  // Space between the option letter and the answer text
            Expanded(
              child: Wrap(
                children: [
                  Text(
                    answer,  // Option answer text
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,  // Text color based on selection
                      fontSize: 18,  // Font size for the answer text
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
