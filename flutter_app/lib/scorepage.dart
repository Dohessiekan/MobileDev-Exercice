import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // Handle navigation to different pages based on index
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.0),
        child: AppBar(
          backgroundColor: const Color(0xFF303384),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Leaderboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 40),
                  // Adjust the width as needed for spacing
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 45),
                          backgroundColor: Color.fromARGB(137, 83, 87, 192),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Weekly',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'FiraSansMedium',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 45),
                          backgroundColor: Color.fromARGB(103, 137, 141, 247),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'All Time',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(153, 255, 255, 255),
                            fontFamily: 'FiraSansMedium',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 240, // Adjusted height to accommodate the PieChart
                decoration: BoxDecoration(
                  color: Color.fromARGB(164, 30, 15, 99),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        'You scored',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'FiraSansBold',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: CircularProgressIndicator(
                            value: 37 / 50, // Adjusted score value
                            strokeWidth: 10,
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(48, 80, 132, 1),
                            ),
                          ),
                        ),
                        Text(
                          '37/50', // Updated score text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'FiraSansBold',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.6, // Adjusted height
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: 10, // Example number of items
                  itemBuilder: (context, index) {
                    Widget? crownIcon;
                    if (index == 0) {
                      crownIcon = Icon(Icons.whatshot, color: Colors.amber); // Gold crown
                    } else if (index == 1) {
                      crownIcon = Icon(Icons.star, color: Colors.grey); // Silver crown
                    } else if (index == 2) {
                      crownIcon = Icon(Icons.star_border, color: Colors.orange); // Bronze crown
                    } else {
                      crownIcon = SizedBox.shrink();
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/avatar.png'), // Example avatar image
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}', // Example user name
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'FiraSansMedium',
                                    ),
                                  ),
                                  Text(
                                    '${(50 - index * 5).clamp(0, 50)} pts', // Example points calculation
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'FiraSansMedium',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            crownIcon ?? SizedBox.shrink(),
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
        height: 80, // Increased height for the bottom navigation bar
        decoration: BoxDecoration(
          color: Colors.white, // Background color for better distinction
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Transparent background to show the container color
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Color(0xFF6A6DB5), // Different color for unselected items
          onTap: _onItemTapped,
          iconSize: 30, // Increased icon size
          selectedFontSize: 16, // Increased font size for selected item
          unselectedFontSize: 14, // Increased font size for unselected items
        ),
      ),
    );
  }
}
