import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';  // Import Firebase core package
import 'package:firebase_auth/firebase_auth.dart';  // Import FirebaseAuth package
import 'blocs/courses_event.dart';
import 'firebase_options.dart';  // Import your Firebase options
import 'package:flutter_bloc/flutter_bloc.dart';  // Import flutter_bloc package
import 'pages/login_page.dart';
import 'register.dart';
import 'homepage.dart';
import 'Coursework.dart';
import 'scorepage.dart';
import 'courses.dart';
import 'blocs/courses_bloc.dart';  // Import your CoursesBloc
import 'repositories/courses_repository.dart';  // Import your CoursesRepository

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  final CoursesRepository repository = CoursesRepository();  // Initialize CoursesRepository

  runApp(
    BlocProvider(
      create: (context) => CoursesBloc(repository)..add(FetchCourses()),  // Initialize CoursesBloc and add FetchCourses event
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',  // Title of the application
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),  // Define the color scheme of the app with a seed color
        useMaterial3: true,  // Use Material 3 design principles
      ),
      home: const WelcomePage(),  // Start the app with the WelcomePage widget
    );
  }
}

// WelcomePage widget is the initial screen of the application
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);  // Constructor for the WelcomePage widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),  // Add padding around the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Center the content vertically in the column
            children: [
              Image.asset('assets/edquest.png'),  // Display the application's logo image
              Image.asset('assets/lquest.png'),   // Display another image (could be a logo or brand image)
              const SizedBox(height: 5),  // Add space between the image and the text
              const Text(
                'Embark on your quest for knowledge! Master new skills and uncover hidden wisdom!',
                textAlign: TextAlign.center,  // Center the text within the available width
                style: TextStyle(
                  fontSize: 24,  // Set the font size of the text
                  fontWeight: FontWeight.bold,  // Make the text bold
                  fontFamily: 'FiraSansMedium',  // Ensure this font is available in the project
                  color: Color(0xFF404040),  // Set the text color
                ),
              ),
              const SizedBox(height: 30),  // Add space before the first button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),  // Navigate to the RegisterPage when the button is pressed
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 70),  // Set the size of the button
                  backgroundColor: const Color(0xFFF9B32D),  // Set the background color of the button
                  elevation: 5,  // Add shadow to the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),  // Round the corners of the button
                  ),
                ),
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(
                      fontSize: 18,  // Set the font size of the button text
                      color: Colors.white,  // Set the text color of the button
                      fontFamily: 'FiraSansMedium'),  // Ensure this font is available in the project
                ),
              ),
              const SizedBox(height: 15),  // Add space between the two buttons
              ElevatedButton(
                onPressed: () => Get.to(() => const LoginPage()),  // Navigate to the LoginPage using GetX when the button is pressed
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 70),  // Set the size of the button
                  backgroundColor: const Color(0xFF303384),  // Set the background color of the button
                  elevation: 5,  // Add shadow to the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),  // Round the corners of the button
                  ),
                ),
                child: const Text(
                  'I ALREADY HAVE AN ACCOUNT',
                  style: TextStyle(
                      fontSize: 18,  // Set the font size of the button text
                      color: Colors.white,  // Set the text color of the button
                      fontFamily: 'FiraSansMedium'),  // Ensure this font is available in the project
                ),
              ),  // Button to navigate to the LoginPage
            ],
          ),
        ),
      ),
    );
  }
}
