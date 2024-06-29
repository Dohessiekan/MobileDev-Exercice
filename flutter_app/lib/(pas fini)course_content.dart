import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      fontFamily: 'Ubuntu', // Set the font family to Ubuntu
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      body: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF303384),
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Details Course',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () {
                  // Add your profile icon action here
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'UI UX Design',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
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
          const SizedBox(height: 20), // Add space between the title and the container
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0), // Set top left corner radius
                  topRight: Radius.circular(0.0), // Set top right corner radius
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Week',
                      style: TextStyle(
                        color: Color(0xFF303384), // Set the color to purple
                        fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9B32D), // Set the background color to F9B32D
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303384),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303384),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303384),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Add space between the boxes and the new title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'UI UX Design Defined',
                      style: TextStyle(
                        color: Color(0xFF303384), // Set the color to match the background
                        fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Add your other container content here
                  const Center(
                    child: Text(
                      '', // Remplacer par votre contenu
                      style: TextStyle(
                        fontFamily: 'Ubuntu', // Set the font family to Ubuntu
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
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