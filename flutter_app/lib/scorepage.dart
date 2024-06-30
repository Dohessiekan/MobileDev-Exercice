import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int _selectedIndex = 0;  // Variable to keep track of the selected index for the BottomNavigationBar

  // Method to handle navigation when an item is tapped in the BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),  // Background color for the entire page
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.0),  // Height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF303384),  // Background color of the AppBar
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),  // Padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with a back button and the title 'Leaderboard'
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),  // Back arrow icon
                    color: Colors.white,  // Color of the icon
                    onPressed: () {
                      Navigator.pop(context);  // Navigate back to the previous screen
                    },
                  ),
                  Text(
                    'Leaderboard',  // Title text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,  // Font size for the title
                      fontWeight: FontWeight.bold,  // Bold text
                    ),
                  ),
                  SizedBox(width: 40),  // Spacer to align the title properly
                ],
              ),
              SizedBox(height: 20),  // Space between the header and the buttons
              // Row with two buttons for 'Weekly' and 'All Time' leaderboards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),  // Horizontal padding for the buttons
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the 'Weekly' button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 45),  // Button size
                          backgroundColor: Color.fromARGB(137, 83, 87, 192),  // Button color
                          elevation: 5,  // Button shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),  // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Weekly',  // Button text
                          style: TextStyle(
                            fontSize: 18,  // Font size of the text
                            color: Colors.white,  // Text color
                            fontFamily: 'FiraSansMedium',  // Font family for the text
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),  // Space between the two buttons
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the 'All Time' button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 45),  // Button size
                          backgroundColor: Color.fromARGB(103, 137, 141, 247),  // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),  // Rounded corners
                          ),
                        ),
                        child: Text(
                          'All Time',  // Button text
                          style: TextStyle(
                            fontSize: 18,  // Font size of the text
                            color: const Color.fromARGB(153, 255, 255, 255),  // Text color
                            fontFamily: 'FiraSansMedium',  // Font family for the text
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),  // Space between the buttons and the score container
              // Container displaying the user's score with a circular progress indicator
              Container(
                width: double.infinity,
                height: 240,  // Height of the score container
                decoration: BoxDecoration(
                  color: Color.fromARGB(164, 30, 15, 99),  // Background color of the container
                  borderRadius: BorderRadius.circular(20),  // Rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,  // Center content vertically
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        'You scored',  // Text above the score
                        style: TextStyle(
                          color: Colors.white,  // Text color
                          fontSize: 24,  // Font size
                          fontFamily: 'FiraSansBold',  // Font family for the text
                          fontWeight: FontWeight.w800,  // Font weight
                        ),
                      ),
                    ),
                    SizedBox(height: 10),  // Space between the text and the score indicator
                    Stack(
                      alignment: Alignment.center,  // Center content in the stack
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,  // Size of the circular progress indicator
                          child: CircularProgressIndicator(
                            value: 37 / 50,  // Progress value
                            strokeWidth: 10,  // Width of the progress bar
                            backgroundColor: Colors.white,  // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(48, 80, 132, 1),  // Progress bar color
                            ),
                          ),
                        ),
                        Text(
                          '37/50',  // Displayed score
                          style: TextStyle(
                            color: Colors.white,  // Text color
                            fontSize: 24,  // Font size
                            fontFamily: 'FiraSansBold',  // Font family for the text
                            fontWeight: FontWeight.w800,  // Font weight
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),  // Space between the score container and the leaderboard
              // Container for the leaderboard list
              Container(
                height: MediaQuery.of(context).size.height * 0.6,  // Height of the leaderboard section
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,  // Background color of the container
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),  // Rounded top left corner
                    topRight: Radius.circular(20),  // Rounded top right corner
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),  // Padding for the list view
                  itemCount: 10,  // Number of items in the list
                  itemBuilder: (context, index) {
                    Widget? crownIcon;
                    if (index == 0) {
                      crownIcon = Icon(Icons.whatshot, color: Colors.amber);  // Gold crown for the top player
                    } else if (index == 1) {
                      crownIcon = Icon(Icons.star, color: Colors.grey);  // Silver crown for the second player
                    } else if (index == 2) {
                      crownIcon = Icon(Icons.star_border, color: Colors.orange);  // Bronze crown for the third player
                    } else {
                      crownIcon = SizedBox.shrink();  // No icon for other players
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),  // Vertical padding for each list item
                      child: Container(
                        padding: EdgeInsets.all(15.0),  // Padding inside the list item
                        decoration: BoxDecoration(
                          color: Colors.white,  // Background color of the list item
                          borderRadius: BorderRadius.circular(15),  // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,  // Shadow color
                              blurRadius: 5,  // Shadow blur radius
                              offset: Offset(0, 2),  // Shadow offset
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,  // Avatar size
                              backgroundImage: AssetImage('assets/edquest.png'),  // Avatar image
                            ),
                            SizedBox(width: 20),  // Space between avatar and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}',  // Example username
                                    style: TextStyle(
                                      fontSize: 18,  // Font size for the username
                                      fontFamily: 'FiraSansMedium',  // Font family for the text
                                    ),
                                  ),
                                  Text(
                                    '${(50 - index * 5).clamp(0, 50)} pts',  // Example points calculation
                                    style: TextStyle(
                                      fontSize: 16,  // Font size for the points
                                      fontFamily: 'FiraSansMedium',  // Font family for the text
                                      color: Colors.grey,  // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),  // Space between text and crown icon
                            crownIcon ?? SizedBox.shrink(),  // Display the crown icon if any
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,  // Height of the BottomNavigationBar
        decoration: BoxDecoration(
          color: Colors.white,  // Background color of the BottomNavigationBar
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),  // Rounded top left corner
            topRight: Radius.circular(20),  // Rounded top right corner
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,  // Shadow color
              offset: Offset(0, -1),  // Shadow offset
              blurRadius: 10,  // Shadow blur radius
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,  // Transparent background for the BottomNavigationBar
          elevation: 0,  // Remove default shadow
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),  // Icon for Home tab
              label: 'Home',  // Label for Home tab
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),  // Icon for Courses tab
              label: 'Courses',  // Label for Courses tab
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),  // Icon for Profile tab
              label: 'Profile',  // Label for Profile tab
            ),
          ],
          currentIndex: _selectedIndex,  // Currently selected tab
          selectedItemColor: Colors.amber[800],  // Color for the selected tab
          unselectedItemColor: Color(0xFF6A6DB5),  // Color for unselected tabs
          onTap: _onItemTapped,  // Method called on tab change
          iconSize: 30,  // Size of the icons
          selectedFontSize: 16,  // Font size for the selected tab label
          unselectedFontSize: 14,  // Font size for unselected tab labels
        ),
      ),
    );
  }
}
