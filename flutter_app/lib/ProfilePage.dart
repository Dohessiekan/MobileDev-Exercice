import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303384),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 120),
                _buildProfileContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Header with logout and settings icons
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            // Redirige vers la page de connexion ou montre un message
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            print('Icon settings pressed!');
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // Main profile content with stats and a special message
  Widget _buildProfileContent() {
    return Stack(
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
                _buildProfileName(),
                const SizedBox(height: 10),
                _buildStatsTitle(),
                const SizedBox(height: 10),
                _buildStatsRow(),
                const SizedBox(height: 20),
                _buildSpecialMessage(),
              ],
            ),
          ),
        ),
        Positioned(
          top: -70,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/logo.png'),
          ),
        ),
      ],
    );
  }

  // Display profile name
  Widget _buildProfileName() {
    return const Text(
      'Mark Brys',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // Display "Stats" title
  Widget _buildStatsTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Stats',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Display stats in a row
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _buildRedContainer('526', 'Total XP', false),
            const SizedBox(height: 20),
            _buildRedContainer('60%', 'Total XP', false),
          ],
        ),
        Column(
          children: [
            _buildRedContainer('25', 'Total quizzes played', true),
            const SizedBox(height: 20),
            _buildRedContainer('8', 'Quizzes created', true),
          ],
        ),
      ],
    );
  }

  // Display a special message at the bottom
  Widget _buildSpecialMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: const Color(0xFF6A5AE0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'You have played a total of ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '24 quizzes',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: ' this month!',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Build a red container for stats
  Widget _buildRedContainer(String content, String description, bool isSpecial) {
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
