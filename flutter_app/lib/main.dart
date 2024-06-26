import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/login_page.dart';
import 'register.dart';
import 'homepage.dart';
import 'Coursework.dart';
import 'scorepage.dart';
import 'courses.dart';
void main() {
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: LoginPage(),        
  ));
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/edquest.png'),
              Image.asset('assets/lquest.png'),
              SizedBox(height: 5), // Add spacing between image and text
              Text(
                'Embark on your quest for knowledge! Master new skills and uncover hidden wisdom.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FiraSansMedium',
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(320, 70),
                  backgroundColor: Color(0xFFF9B32D),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                  ),
                ),
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'FiraSansMedium'),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(320, 70),
                  backgroundColor: Color(0xFF303384),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                  ),
                ),
                child: Text(
                  'I ALREADY HAVE AN ACCOUNT',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'FiraSansMedium'),
                ),
              ), // Corrected syntax here
            ],
          ),
        ),
      ),
    );
  }
}
