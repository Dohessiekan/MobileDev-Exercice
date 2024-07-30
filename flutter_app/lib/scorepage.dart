import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScorePage extends StatefulWidget {
  final int score;
  const ScorePage({Key? key, required this.score}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int _selectedIndex = 0; // Variable to keep track of the selected index for the BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<Map<String, dynamic>> _fetchUserProfile(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists && userDoc.data() != null) {
      return userDoc.data() as Map<String, dynamic>;
    }
    return {};
  }

  Future<void> _updateXPPoints(int score) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return; // Handle case where user is not logged in

    final userDocRef = FirebaseFirestore.instance.collection('users').doc(userId);
    final userDoc = await userDocRef.get();
    int currentXP = 0;

    if (userDoc.exists && userDoc.data() != null) {
      final data = userDoc.data() as Map<String, dynamic>;
      currentXP = data['xpPoints'] ?? 0;
    }

    // Define the XP calculation logic
    int xpEarned = score * 10; // Example: 10 XP points per score point

    // Update the user's XP points
    await userDocRef.set({
      'xpPoints': currentXP + xpEarned
    }, SetOptions(merge: true)); // Use merge to keep other fields intact
  }

  @override
  void initState() {
    super.initState();
    _updateXPPoints(widget.score); // Update XP points when the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(48, 51, 132, 1), // Background color for the entire page
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(15.0), // Height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF303384), // Background color of the AppBar
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back), // Back arrow icon
                    color: Colors.white, // Color of the icon
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                  ),
                  const Text(
                    'Leaderboard', // Title text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25, // Font size for the title
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                  const SizedBox(width: 40), // Spacer to align the title properly
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 45),
                          backgroundColor: const Color.fromARGB(137, 83, 87, 192),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Weekly',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'FiraSansMedium',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 45),
                          backgroundColor: const Color.fromARGB(103, 137, 141, 247),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'All Time',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(153, 255, 255, 255),
                            fontFamily: 'FiraSansMedium',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 240, // Height of the score container
                decoration: BoxDecoration(
                  color: const Color.fromARGB(164, 30, 15, 99), // Background color of the container
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Text(
                        'You scored', // Text above the score
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 24, // Font size
                          fontFamily: 'FiraSansBold', // Font family for the text
                          fontWeight: FontWeight.w800, // Font weight
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // Space between the text and the score indicator
                    Stack(
                      alignment: Alignment.center, // Center content in the stack
                      children: [
                        const SizedBox(
                          width: 150,
                          height: 150, // Size of the circular progress indicator
                          child: CircularProgressIndicator(
                            value: 7.4, // Progress value
                            strokeWidth: 10, // Width of the progress bar
                            backgroundColor: Colors.white, // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(48, 80, 132, 1), // Progress bar color
                            ),
                          ),
                        ),
                        Text(
                          '${widget.score}/10', // Displayed score
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 24, // Font size
                            fontFamily: 'FiraSansBold', // Font family for the text
                            fontWeight: FontWeight.w800, // Font weight
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.6, // Height of the leaderboard section
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color of the container
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), // Rounded top left corner
                    topRight: Radius.circular(20), // Rounded top right corner
                  ),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('scores').orderBy('score', descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final scores = snapshot.data!.docs;
                    return ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: scores.length,
                      itemBuilder: (context, index) {
                        final data = scores[index].data() as Map<String, dynamic>;
                        final userId = data['userId'] ?? '';
                        final points = data['score'] != null ? data['score'].toString() : '0';
                        Widget? crownIcon;

                        if (index == 0) {
                          crownIcon = const Icon(Icons.whatshot, color: Colors.amber);
                        } else if (index == 1) {
                          crownIcon = const Icon(Icons.star, color: Colors.grey);
                        } else if (index == 2) {
                          crownIcon = const Icon(Icons.star_border, color: Colors.orange);
                        } else {
                          crownIcon = const SizedBox.shrink();
                        }

                        return FutureBuilder<Map<String, dynamic>>(
                          future: _fetchUserProfile(userId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            final userProfile = snapshot.data ?? {};
                            final username = userProfile['username'] ?? 'Unknown';
                            final profileImageURL = userProfile['profileImageURL'] ?? '';

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
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
                                      backgroundImage: profileImageURL.isNotEmpty
                                          ? NetworkImage(profileImageURL)
                                          : AssetImage('assets/edquest.png') as ImageProvider,
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            username,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'FiraSansMedium',
                                            ),
                                          ),
                                          Text(
                                            '$points pts',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'FiraSansMedium',
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    crownIcon ?? const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
