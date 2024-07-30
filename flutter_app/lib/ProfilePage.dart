import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'settings_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Firebase Authentication instance
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; // Firestore instance for database interactions
  File? _profileImage; // Local file for profile image
  String? _username; // Username of the user
  String?
      _profileImageURL; // URL of the profile image stored in Firebase Storage
  int _coursesTaken = 0; // Number of courses taken by the user
  int _quizzesTaken = 0; // Number of quizzes taken by the user
  int _quizzesThisMonth = 0; // Number of quizzes taken by the user this month

  @override
  void initState() {
    super.initState();
    _fetchUsername(); // Fetch username on init
    _fetchProfileImageURL(); // Fetch profile image URL on init
    _fetchCoursesTaken(); // Fetch number of courses taken on init
    _fetchQuizzesTaken(); // Fetch number of quizzes taken on init
  }

  // Fetch username from Firestore
  Future<void> _fetchUsername() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _username = userDoc[
              'username']; // Assuming 'username' is the field in Firestore
        });
      }
    }
  }

  // Fetch profile image URL from Firestore
  Future<void> _fetchProfileImageURL() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _profileImageURL = userDoc['profileImageURL'];
        });
      }
    }
  }

  // Fetch the number of courses taken from Firestore
  Future<void> _fetchCoursesTaken() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        List<dynamic> enrolledCourses = userDoc['enrolledCourses'];
        setState(() {
          _coursesTaken = enrolledCourses.length;
        });
      }
    }
  }

  // Fetch the number of quizzes taken from Firestore
  Future<void> _fetchQuizzesTaken() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DateTime now = DateTime.now();
      DateTime startOfMonth = DateTime(now.year, now.month, 1);

      QuerySnapshot quizSnapshot = await _firestore
          .collection('scores')
          .where('userId', isEqualTo: user.uid)
          .get();

      int quizzesThisMonth = 0;
      for (var doc in quizSnapshot.docs) {
        DateTime quizDate = (doc['timestamp'] as Timestamp).toDate();
        if (quizDate.isAfter(startOfMonth)) {
          quizzesThisMonth++;
        }
      }

      setState(() {
        _quizzesTaken = quizSnapshot.size;
        _quizzesThisMonth = quizzesThisMonth;
      });
    }
  }

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
            await FirebaseAuth.instance.signOut(); // Log out the user
            // Redirect to login page or show a message
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SettingsPage())); // Navigate to settings page
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
            padding: const EdgeInsets.only(top: 70.0, left: 10.0, right: 10.0),
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
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!) as ImageProvider<Object>?
                    : (_profileImageURL != null
                        ? NetworkImage(_profileImageURL!)
                        : null),
                child: _profileImageURL == null && _profileImage == null
                    ? Icon(Icons.person, size: 50, color: Colors.grey)
                    : null,
              ),
              Positioned(
                right: -5,
                bottom: -10,
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Color.fromARGB(255, 187, 183, 183),
                  ),
                  onPressed: _pickProfileImage, // Pick a profile image
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Display profile name
  Widget _buildProfileName() {
    return Text(
      _username ??
          'Loading...', // Display username or "Loading..." while fetching
      style: const TextStyle(
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
            _buildRedContainer('526', 'Total XP', false), // Example stat
            const SizedBox(height: 20),
            _buildRedContainer('60%', 'Total XP', false), // Example stat
          ],
        ),
        Column(
          children: [
            _buildRedContainer('$_quizzesTaken', 'Total quizzes played',
                true), // Display total quizzes taken
            const SizedBox(height: 20),
            _buildRedContainer('$_coursesTaken', 'Courses taken',
                true), // Display total courses taken
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
              text: TextSpan(
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
                    text:
                        '$_quizzesThisMonth quizzes', // Display quizzes taken this month
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
  Widget _buildRedContainer(
      String content, String description, bool isSpecial) {
    return Container(
      width: 150,
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

  // Function to pick profile image from gallery
  Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
      _uploadProfileImage(); // Upload the picked image
    }
  }

  // Function to upload profile image to Firebase Storage
  Future<void> _uploadProfileImage() async {
    if (_profileImage == null) return;

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String filePath = 'profile_images/${user.uid}.png';

        // Start the upload
        UploadTask uploadTask =
            FirebaseStorage.instance.ref(filePath).putFile(_profileImage!);

        // Show a progress indicator while uploading
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          print('Upload progress: $progress%');
        });

        // Wait for the upload to complete
        await uploadTask;

        // Get the download URL
        String downloadURL =
            await FirebaseStorage.instance.ref(filePath).getDownloadURL();

        // Update Firestore with the new profile image URL
        await _firestore.collection('users').doc(user.uid).update({
          'profileImageURL': downloadURL,
        });

        // Update the profile image URL in the state
        setState(() {
          _profileImageURL = downloadURL;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile image updated successfully')),
        );
      }
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile image: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile image: $e')),
      );
    }
  }
}
