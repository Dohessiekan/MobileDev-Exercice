import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 70),
                  backgroundColor: Color(0xFFF9B32D),
                  elevation: 5,
                  // Specify button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set border radius
                    // You can also specify other border properties such as side
                    // side: BorderSide(color: Colors.red, width: 2), // Border side
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 70),
                  backgroundColor: Color(0xFF303384),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set border radius
                    // You can also specify other border properties such as side
                    // side: BorderSide(color: Colors.red, width: 2), // Border side
                  ), // Specify button color
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
