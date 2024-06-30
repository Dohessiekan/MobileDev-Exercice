import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  void handleWestIconPressed() {
    // Ajoutez ici la logique que vous souhaitez exécuter lorsque l'icône west est pressée
    print('Icon west pressed!');
  }

  void handleSettingsIconPressed() {
    // Ajoutez ici la logique que vous souhaitez exécuter lorsque l'icône settings est pressée
    print('Icon settings pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: handleWestIconPressed,
                    icon: Icon(
                      Icons.west,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: handleSettingsIconPressed,
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            const Text(
                              'Mark Brys',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Stats',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    _buildRedContainer(
                                        '526', 'Total XP', false),
                                    const SizedBox(height: 20),
                                    _buildRedContainer(
                                        '60%', 'Total XP', false),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _buildRedContainer(
                                        '25', 'Total quizzes played', true),
                                    const SizedBox(height: 20),
                                    _buildRedContainer(
                                        '8', 'Quizzes created', true),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Color(0xFF6A5AE0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'You have played a total of ',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '24 quizzes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: ' this month!',
                                            style:
                                                TextStyle(color: Colors.black),
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
                      top: -70,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/Avatar.png'),
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

  Widget _buildRedContainer(
      String content, String description, bool isSpecial) {
    return Container(
      width: 160,
      height: 85,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w900,
                color: Color(0xFF303384),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF858494),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
