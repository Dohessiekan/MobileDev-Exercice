import 'package:flutter/material.dart';

class PasswordResetSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8.0), // Space around the circle
          decoration: BoxDecoration(
            color: Colors.grey[300], // Background color of the circle
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black, // Color of the arrow
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0), // General padding for the page
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Password Reset Successful',
                style: TextStyle(
                  fontSize: 24, // Size of the text
                  color: Colors.black, // Color of the text
                  fontWeight: FontWeight.bold, // Weight of the text
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Your password has been changed successfully..',
                style: TextStyle(
                  fontSize: 16, // Size of the text
                  color: Colors.grey, // Color of the text
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30), // Space between message and button
              SizedBox(
                width: double.infinity, // Full width button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF303384), // Background color
                    padding: EdgeInsets.symmetric(vertical: 15.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Rounded borders
                    ),
                  ),
                  onPressed: () {
                    // Navigate to login page
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Return to Login',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16, // Text size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: PasswordResetSuccessPage(),
));
