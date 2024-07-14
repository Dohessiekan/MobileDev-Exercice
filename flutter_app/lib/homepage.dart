import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_app/courses.dart';
import 'package:flutter_app/detailcourse.dart';
import 'package:get/get.dart';

import 'ProfilePage.dart';

// HomePage widget that serves as the main page of the application
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();  // Create the state for the HomePage widget
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;  // Variable to keep track of the selected index for navigation

  // Method to handle tab changes or other actions
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected index
    });
    // Handle navigation or any other action here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),  // Set the background color of the page
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),  // Set the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF303384),  // Set the AppBar background color
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),  // Add padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Align children widgets to the start of the column
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(double.infinity, 400),  // Set the size for the custom background painting
                    painter: WavePainter(),  // Use the WavePainter class to create a wave background
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Align children widgets to the start of the column
                    children: [
                      // Header with a welcome message
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,  // Align the start of the row
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,  // Align the children of the column to the start
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color(0xFFF9B32D),  // Icon color
                                    size: 28,  // Icon size
                                  ),
                                  const SizedBox(width: 5),  // Add space between the icon and text
                                  const Text(
                                    'GOOD MORNING',
                                    style: TextStyle(
                                      fontFamily: 'Fira Sans',  // Font family for the text
                                      color: Color(0xFFF9B32D),  // Text color
                                      fontSize: 18,  // Text size
                                      fontWeight: FontWeight.w500,  // Text weight
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),  // Add space between the message and the name
                              const Text(
                                'Kevin Simo',
                                style: TextStyle(
                                  fontFamily: 'Fira Sans',  // Font family for the text
                                  color: Colors.white,  // Text color
                                  fontSize: 28,  // Text size
                                  fontWeight: FontWeight.w400,  // Text weight
                                ),
                              ),
                            ],
                          ),
                          Spacer(),  // Add space between the text and the profile picture
                          GestureDetector(
                            onTap: () => Get.to(() => Profile()),  // Navigate to the Profile page when tapped
                            child: CircleAvatar(
                              radius: 33,  // Radius for the profile picture
                              backgroundImage: AssetImage('assets/edquest.png'),  // Profile picture image
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),  // Add space before the recent courses section
                      Container(
                        width: double.infinity,  // Container width takes the full available width
                        height: 120,  // Height for the pie chart section
                        decoration: BoxDecoration(
                          color: Color.fromARGB(164, 30, 15, 99),  // Background color of the container
                          borderRadius: BorderRadius.circular(20),  // Border radius for rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),  // Add padding inside the container
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,  // Align children widgets to the center of the row
                            children: [
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,  // Align children widgets to the start
                                  mainAxisAlignment: MainAxisAlignment.center,  // Center the content vertically
                                  children: [
                                    const Text(
                                      'RECENT COURSES',
                                      style: TextStyle(
                                        fontFamily: 'Fira Sans',  // Font family for the text
                                        color: Color.fromARGB(158, 255, 255, 255),  // Text color
                                        fontSize: 17,  // Text size
                                        fontWeight: FontWeight.w700,  // Text weight
                                      ),
                                    ),
                                    const SizedBox(height: 8),  // Add space between the title and the course name
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.headset,
                                          color: Colors.white,  // Icon color
                                          size: 28,  // Icon size
                                        ),
                                        const SizedBox(width: 5),  // Add space between the icon and text
                                        Text(
                                          'Data Science Basics',
                                          style: TextStyle(
                                            fontFamily: 'Fira Sans',  // Font family for the text
                                            color: Colors.white,  // Text color
                                            fontSize: 20,  // Text size
                                            fontWeight: FontWeight.w700,  // Text weight
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 60),  // Add space between the text and the pie chart
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,  // Set the aspect ratio for the pie chart
                                  child: PieChart(
                                    PieChartData(
                                      sections: [
                                        PieChartSectionData(
                                          color: Color(0xFFA5AED0),  // Color for the first pie chart section
                                          value: 30,  // Value for the first section
                                          title: '30%',  // Title for the first section
                                          radius: 30,  // Radius for the pie chart section
                                          titleStyle: TextStyle(
                                            fontSize: 15,  // Text size for the title
                                            fontWeight: FontWeight.bold,  // Text weight for the title
                                            color: Colors.white,  // Text color for the title
                                          ),
                                        ),
                                        PieChartSectionData(
                                          color: Color(0xFF6A6DB5),  // Color for the second pie chart section
                                          value: 70,  // Value for the second section
                                          title: '70%',  // Title for the second section
                                          radius: 30,  // Radius for the pie chart section
                                          titleStyle: TextStyle(
                                            fontSize: 15,  // Text size for the title
                                            fontWeight: FontWeight.bold,  // Text weight for the title
                                            color: Colors.white,  // Text color for the title
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),  // Add space before the featured courses section
                      Container(
                        width: double.infinity,  // Container width takes the full available width
                        height: 260,  // Height for the featured courses section
                        decoration: BoxDecoration(
                          color: Color.fromARGB(103, 55, 141, 212),  // Background color of the container
                          borderRadius: BorderRadius.circular(20),  // Border radius for rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),  // Add padding inside the container
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,  // Align children widgets to the center
                            children: [
                              const Text(
                                'FEATURED',
                                style: TextStyle(
                                  fontFamily: 'Fira Sans',  // Font family for the text
                                  color: Colors.white,  // Text color
                                  fontSize: 17,  // Text size
                                  fontWeight: FontWeight.w700,  // Text weight
                                ),
                              ),
                              const SizedBox(height: 20),  // Add space between the title and the text
                              const Text(
                                'Take part in challenges with friends or other players and have a fun time',
                                textAlign: TextAlign.center,  // Center the text within the available width
                                style: TextStyle(
                                  fontFamily: 'Fira Sans',  // Font family for the text
                                  color: Colors.white,  // Text color
                                  fontSize: 24,  // Text size
                                  fontWeight: FontWeight.w700,  // Text weight
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),  // Add space before the popular courses section
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 10),  // Add padding inside the container
                        width: double.infinity,  // Container width takes the full available width
                        decoration: BoxDecoration(
                          color: Colors.white,  // Background color of the container
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),  // Top-left corner radius
                            topRight: Radius.circular(20),  // Top-right corner radius
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Align children widgets to the start
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between the title and the button
                              children: [
                                Text(
                                  'Popular Courses',
                                  style: TextStyle(
                                    fontFamily: 'Fira Sans',  // Font family for the text
                                    fontSize: 24,  // Text size
                                    fontWeight: FontWeight.bold,  // Text weight
                                    color: Colors.black,  // Text color
                                  ),
                                ),
                                TextButton(
                                  onPressed: ()=>Get.to(()=>const Courses()),  // Navigate to the Courses page
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      fontFamily: 'Fira Sans',  // Font family for the text
                                      fontSize: 16,  // Text size
                                      fontWeight: FontWeight.bold,  // Text weight
                                      color: Color(0xFF6A6DB5),  // Text color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),  // Add space after the popular courses title
                            // List of popular courses
                            ListView.builder(
                              shrinkWrap: true,  // Shrink the list to fit the content
                              physics: NeverScrollableScrollPhysics(),  // Disable scrolling
                              itemCount: 5,  // Number of items in the list
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(
                                    'Item $index',  // Course title
                                    style: TextStyle(
                                      fontFamily: 'Fira Sans',  // Font family for the text
                                      fontSize: 18,  // Text size
                                      fontWeight: FontWeight.bold,  // Text weight
                                    ),
                                  ),
                                  subtitle: Text('Description of Item $index'),  // Course description
                                  leading: Container(
                                    width: 50,  // Width for the course image
                                    height: 60,  // Height for the course image
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),  // Border radius for the image
                                      image: DecorationImage(
                                        image: AssetImage('assets/edquest.png'),  // Course image
                                        fit: BoxFit.cover,  // Image fit
                                      ),
                                    ),
                                  ),
                                  trailing: Icon(Icons.chevron_right),  // Icon for expanding to course details
                                  onTap:()=>Get.to(()=>const Courses()),  // Navigate to the Course Details page
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// WavePainter class to create a custom wave background for the HomePage
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF303384)  // Background color for the wave
      ..style = PaintingStyle.fill;  // Fill style for the painting

    Path path = Path();
    path.moveTo(0, size.height * 0.4);  // Move to the starting point for the wave
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.4,  // Create the first wave curve
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.45, size.width, size.height * 0.4,  // Create the second wave curve
    );
    path.lineTo(size.width, size.height);  // Draw a line to the bottom right corner
    path.lineTo(0, size.height);  // Draw a line to the bottom left corner
    path.close();  // Close the path

    canvas.drawPath(path, paint);  // Draw the background wave path

    Paint wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.7)  // Color for the wave lines
      ..style = PaintingStyle.stroke  // Stroke style for the wave lines
      ..strokeWidth = 2.0;  // Width of the wave lines

    Path wavePath1 = Path();
    wavePath1.moveTo(0, size.height * 0.3);  // Move to the starting point for the first wave line
    wavePath1.quadraticBezierTo(
      size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.3,  // Create the first wave line curve
    );
    wavePath1.quadraticBezierTo(
      size.width * 0.75, size.height * 0.25, size.width, size.height * 0.45,  // Create the second wave line curve
    );
    canvas.drawPath(wavePath1, wavePaint);  // Draw the first wave line

    Path wavePath2 = Path();
    wavePath2.moveTo(0, size.height * 0.5);  // Move to the starting point for the second wave line
    wavePath2.quadraticBezierTo(
      size.width * 0.25, size.height * 0.55, size.width * 0.5, size.height * 0.5,  // Create the second wave line curve
    );
    wavePath2.quadraticBezierTo(
      size.width * 0.75, size.height * 0.45, size.width, size.height * 0.5,  // Create the third wave line curve
    );
    canvas.drawPath(wavePath2, wavePaint);  // Draw the second wave line

    Path wavePath3 = Path();
    wavePath3.moveTo(0, size.height * 0.7);  // Move to the starting point for the third wave line
    wavePath3.quadraticBezierTo(
      size.width * 0.25, size.height * 0.75, size.width * 0.5, size.height * 0.7,  // Create the third wave line curve
    );
    wavePath3.quadraticBezierTo(
      size.width * 0.75, size.height * 0.65, size.width, size.height * 0.7,  // Create the fourth wave line curve
    );
    canvas.drawPath(wavePath3, wavePaint);  // Draw the third wave line
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;  // Determine if the painter should repaint
  }
}