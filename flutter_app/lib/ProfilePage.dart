import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Variable to keep track of the selected index (not used in this example)
  int _selectedIndex = 0;

  // Method to handle the west icon press action
  void handleWestIconPressed() {
    // Add the logic you want to execute when the west icon is pressed
    print('Icon west pressed!');
  }

  // Method to handle the settings icon press action
  void handleSettingsIconPressed() {
    // Add the logic you want to execute when the settings icon is pressed
    print('Icon settings pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),  // Background color of the entire page
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),  // Horizontal padding for the entire content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Align children to the start of the column
            children: [
              // Row for the header with the logout and settings icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space icons evenly on the header
                children: [
                  IconButton(
                    onPressed: () => Get.to(() => const WelcomePage()),  // Navigate to WelcomePage on press
                    icon: Icon(
                      Icons.logout,  // Logout icon
                      color: Colors.white,  // Icon color
                    ),
                  ),
                  IconButton(
                    onPressed: handleSettingsIconPressed,  // Call the settings icon handler
                    icon: Icon(
                      Icons.settings,  // Settings icon
                      color: Colors.white,  // Icon color
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),  // Space between the header and the content below
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,  // Allow the stack to overflow the bounds
                  alignment: Alignment.topCenter,  // Align the children to the top center
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,  // Background color of the content container
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),  // Rounded top corners
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, left: 10.0, right: 10.0),  // Padding inside the content container
                        child: Column(
                          children: [
                            // Display the user's name
                            const Text(
                              'Mark Brys',  // User's name
                              style: TextStyle(
                                fontSize: 24,  // Font size for the name
                                fontWeight: FontWeight.bold,  // Bold font weight
                                color: Colors.black,  // Text color
                              ),
                            ),
                            const SizedBox(height: 10),  // Space between the name and the "Stats" text
                            Align(
                              alignment: Alignment.centerLeft,  // Align text to the left
                              child: Text(
                                'Stats',  // Section title
                                style: TextStyle(
                                  fontSize: 24,  // Font size for the section title
                                  fontWeight: FontWeight.bold,  // Bold font weight
                                  color: Colors.black,  // Text color
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),  // Space between the "Stats" text and the stats content
                            // Row for displaying user stats
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space stats evenly
                              children: [
                                Column(
                                  children: [
                                    _buildRedContainer(
                                        '526', 'Total XP', false),  // XP stat card
                                    const SizedBox(height: 20),  // Space between stat cards
                                    _buildRedContainer(
                                        '60%', 'Total XP', false),  // XP percentage card
                                  ],
                                ),
                                Column(
                                  children: [
                                    _buildRedContainer(
                                        '25', 'Total quizzes played', true),  // Quizzes played card
                                    const SizedBox(height: 20),  // Space between stat cards
                                    _buildRedContainer(
                                        '8', 'Quizzes created', true),  // Quizzes created card
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),  // Space between the stats and the special offer section
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),  // Padding for the special offer section
                              child: Container(
                                width: double.infinity,  // Full width of the container
                                height: 140,  // Height of the container
                                decoration: BoxDecoration(
                                  color: Color(0xFF6A5AE0),  // Background color for the offer section
                                  borderRadius: BorderRadius.circular(20.0),  // Rounded corners for the container
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),  // Padding inside the offer section
                                    child: RichText(
                                      textAlign: TextAlign.center,  // Center the text in the offer section
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 24,  // Font size for the offer text
                                          fontWeight: FontWeight.bold,  // Bold font weight
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'You have played a total of ',  // Offer message part 1
                                            style:
                                                TextStyle(color: Colors.black),  // Text color
                                          ),
                                          TextSpan(
                                            text: '24 quizzes',  // Offer message part 2
                                            style:
                                                TextStyle(color: Colors.white),  // Text color
                                          ),
                                          TextSpan(
                                            text: ' this month!',  // Offer message part 3
                                            style:
                                                TextStyle(color: Colors.black),  // Text color
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -70,  // Position the avatar 70 pixels above the content container
                      child: CircleAvatar(
                        radius: 50,  // Size of the profile picture
                        backgroundImage: AssetImage('assets/logo.png'),  // Profile picture asset
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a red container widget for displaying stats
  Widget _buildRedContainer(
      String content, String description, bool isSpecial) {
    return Container(
      width: 160,  // Width of the container
      height: 85,  // Height of the container
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),  // Margin for the container
      decoration: BoxDecoration(
        color: Colors.white,  // Background color of the container
        borderRadius: BorderRadius.circular(15.0),  // Rounded corners for the container
        border: Border.all(
          color: Colors.grey,  // Border color
          width: 2.0,  // Border width
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Center the content vertically
        crossAxisAlignment: CrossAxisAlignment.start,  // Align content to the start horizontally
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),  // Left padding for the content
            child: Text(
              content,  // Main content text
              style: const TextStyle(
                fontSize: 24,  // Font size for the content text
                fontFamily: 'Rubik',  // Font family
                fontWeight: FontWeight.w900,  // Font weight
                color: Color(0xFF303384),  // Text color
              ),
            ),
          ),
          const SizedBox(height: 5),  // Space between the content and the description
          Padding(
            padding: const EdgeInsets.only(left: 10.0),  // Left padding for the description
            child: Text(
              description,  // Description text
              style: const TextStyle(
                fontSize: 14,  // Font size for the description text
                color: Color(0xFF858494),  // Text color
              ),
              textAlign: TextAlign.center,  // Center the description text
            ),
          ),
        ],
      ),
    );
  }
}
