import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303384),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                color: Color(0xFF303384),
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 0.0).copyWith(top: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, James',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Learn & test your knowledge',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.blue),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: 50,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    'Popular',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 14,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Science',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 14,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Mathematic',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 14,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text(
                                        'Computer',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 2,
                                        color: Colors.blue,
                                        margin: EdgeInsets.only(top: 2),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                CourseCard(
                                  title: 'UI UX Design',
                                  subtitle: '5 chapters',
                                  hours: '20h',
                                  imagePath: 'assets/group1.png',
                                  
                                ),
                                SizedBox(height: 15),
                                CourseCard(
                                  title: 'Graphic Design',
                                  subtitle: '5 chapters',
                                  hours: '20h',
                                  imagePath: 'assets/group1.png',
                                ),
                                SizedBox(height: 15),
                                CourseCard(
                                  title: 'Web Development',
                                  subtitle: '8 chapters',
                                  hours: '30h',
                                  imagePath: 'assets/group1.png',
                                ),
                                SizedBox(height: 15),
                                CourseCard(
                                  title: 'Data Science',
                                  subtitle: '6 chapters',
                                  hours: '25h',
                                  imagePath: 'assets/group1.png',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Continue Course',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CourseCard(
                              title: '3D Animation',
                              subtitle: '3 chapters',
                              hours: '15h',
                              imagePath: 'assets/group1.png',
                              showRating: false,
                            ),
                          ),
                          SizedBox(height: 25), // Ajout d'un espace pour éviter le débordement
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String hours;
  final String imagePath;
  final bool showRating;

  const CourseCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.hours,
    required this.imagePath,
    this.showRating = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Expanded( // Utilisation de Expanded ici
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.menu_book, size: 16, color: Color(0xFF999999)),
                    SizedBox(width: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Color(0xFF999999)),
                    SizedBox(width: 5),
                    Text(
                      hours,
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (showRating)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 20, color: Colors.yellow),
                SizedBox(height: 5),
                Text(
                  '4.8',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            )
          else
            Icon(Icons.delete, size: 20, color: Colors.red),
        ],
      ),
    );
  }
}
