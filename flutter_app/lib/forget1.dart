import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
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
        padding: EdgeInsets.all(16.0), // General padding for the pagee
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16), // Space between app bar and title
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 24, // Size of the text
                color: Colors.black, // Color of the text
                fontWeight: FontWeight.bold, // Weight of the text
              ),
            ),
            SizedBox(height: 8), // Space between title and subtitle
            Text(
              'Please enter your email to reset the password',
              style: TextStyle(
                fontSize: 16, // Size of the text
                color: Colors.grey, // Color of the text
              ),
            ),
            SizedBox(height: 16), // Space between subtitle and text field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16), // Space between text field and button
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
                  // Handle reset password action
                },
                child: Text(
                  'Reset Password',
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
    );
  }
}

void main() => runApp(MaterialApp(
  home: ForgetPasswordPage(),
));