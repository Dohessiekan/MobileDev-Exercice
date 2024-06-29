import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation or any other action here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjusted height for AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF303384),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(double.infinity, 400),
                    painter: WavePainter(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color(0xFFF9B32D),
                                    size: 28,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'GOOD MORNING',
                                    style: TextStyle(
                                      fontFamily: 'Fira Sans',
                                      color: Color(0xFFF9B32D),
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8), // Adjusted spacing
                              const Text(
                                'Kevin Simo',
                                style: TextStyle(
                                  fontFamily: 'Fira Sans',
                                  color: Colors.white,
                                  fontSize: 28,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: AssetImage('assets/edquest.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Adjust spacing as needed
                      Container(
                        width: double.infinity,
                        height: 120, // Adjusted height to accommodate the PieChart
                        decoration: BoxDecoration(
                          color: Color.fromARGB(164, 30, 15, 99),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'RECENT COURSES',
                                      style: TextStyle(
                                        fontFamily: 'Fira Sans',
                                        color: Color.fromARGB(158, 255, 255, 255),
                                        fontSize: 17,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.headset,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Data Science Basics',
                                          style: TextStyle(
                                            fontFamily: 'Fira Sans',
                                            color: Colors.white,
                                            fontSize: 20,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 80), // Adjusted spacing between text and pie chart
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: PieChart(
                                    PieChartData(
                                      sections: [
                                        PieChartSectionData(
                                          color: Color(0xFFA5AED0),
                                          value: 30,
                                          title: '30%',
                                          radius: 30,
                                          titleStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        PieChartSectionData(
                                          color: Color(0xFF6A6DB5),
                                          value: 70,
                                          title: '70%',
                                          radius: 30,
                                          titleStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
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
                      SizedBox(height: 20), // Adjust spacing as needed
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(103, 55, 141, 212),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'FEATURED',
                                style: TextStyle(
                                  fontFamily: 'Fira Sans',
                                  color: Colors.white,
                                  fontSize: 17,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 20), // Added spacing between the texts
                              const Text(
                                'Take part in challenges with friends or other players and have a fun time',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Fira Sans',
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(200, 65),
                                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    'Find a course',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xFF6A6DB5),
                                      fontFamily: 'FiraSansMedium',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Adjust spacing as needed
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Popular Courses',
                                  style: TextStyle(
                                    fontFamily: 'Fira Sans',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Handle "See All" button tap
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      fontFamily: 'Fira Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF6A6DB5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10), // Added spacing after "Popular Courses"
                            // Example ListView.builder for a list
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(
                                    'Item $index',
                                    style: TextStyle(
                                      fontFamily: 'Fira Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text('Description of Item $index'),
                                  leading: Container(
                                    width: 50,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage('assets/edquest.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () {
                                    // Handle tap on item
                                  },
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

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF303384)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.45, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    Paint wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path wavePath1 = Path();
    wavePath1.moveTo(0, size.height * 0.3);
    wavePath1.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.3);
    wavePath1.quadraticBezierTo(size.width * 0.75, size.height * 0.25,
        size.width, size.height * 0.45);
    canvas.drawPath(wavePath1, wavePaint);

    Path wavePath2 = Path();
    wavePath2.moveTo(0, size.height * 0.5);
    wavePath2.quadraticBezierTo(size.width * 0.25, size.height * 0.55,
        size.width * 0.5, size.height * 0.5);
    wavePath2.quadraticBezierTo(size.width * 0.75, size.height * 0.45,
        size.width, size.height * 0.5);
    canvas.drawPath(wavePath2, wavePaint);

    Path wavePath3 = Path();
    wavePath3.moveTo(0, size.height * 0.7);
    wavePath3.quadraticBezierTo(size.width * 0.25, size.height * 0.75,
        size.width * 0.5, size.height * 0.7);
    wavePath3.quadraticBezierTo(size.width * 0.75, size.height * 0.65,
        size.width, size.height * 0.7);
    canvas.drawPath(wavePath3, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
