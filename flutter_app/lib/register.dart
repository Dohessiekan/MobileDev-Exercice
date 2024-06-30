import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';  // Importing the main file where WelcomePage is likely defined

// Defining RegisterPage as a StatefulWidget
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// State class associated with RegisterPage
class _RegisterPageState extends State<RegisterPage> {
  // Creating a key for the form
  final _formKey = GlobalKey<FormState>();
  // Defining variables to store form values
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Empty app bar for now; you can add actions or titles here if needed
      ),
      body: Container(
        color: Color(0xFFF5F5F5), // Background color of the page
        padding: const EdgeInsets.all(16.0),  // Padding around the content
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,  // Assigning the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/logo.png',  // Logo displayed in the center
                    height: 150,  // Height of the logo
                  ),
                ),
                SizedBox(height: 16.0),  // Space between the logo and the form
                Text(
                  'Username',  // Label for the username field
                  style: TextStyle(
                    fontSize: 16.0,  // Font size of the text
                    color: Color(0xFF303384),  // Text color
                  ),
                ),
                SizedBox(height: 8.0),  // Space between the label and the text field
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),  // Background color of the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),  // Rounded corners of the text field
                      borderSide: BorderSide.none,  // Removing the border of the text field
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';  // Validation for the username field
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value ?? '';  // Saving the username field value
                  },
                ),
                SizedBox(height: 16.0),  // Space between text fields
                Text(
                  'E-mail',  // Label for the email field
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384),  // Text color
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),  // Background color of the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),  // Rounded corners of the text field
                      borderSide: BorderSide.none,  // Removing the border of the text field
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';  // Validation for the email field
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';  // Email format validation
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value ?? '';  // Saving the email field value
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Password',  // Label for the password field
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384),  // Text color
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),  // Background color of the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),  // Rounded corners of the text field
                      borderSide: BorderSide.none,  // Removing the border of the text field
                    ),
                  ),
                  obscureText: true,  // Hides the text for password
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';  // Validation for the password field
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value ?? '';  // Saving the password field value
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Confirm Password',  // Label for the confirm password field
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384),  // Text color
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),  // Background color of the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),  // Rounded corners of the text field
                      borderSide: BorderSide.none,  // Removing the border of the text field
                    ),
                  ),
                  obscureText: true,  // Hides the text for password
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';  // Validation for the confirm password field
                    } else if (value != _password) {
                      return 'Passwords do not match';  // Checks if passwords match
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value ?? '';  // Saving the confirm password field value
                  },
                ),
                SizedBox(height: 32.0),  // Space before the signup button
                SizedBox(
                  width: double.infinity,  // Button takes up the full available width
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 70),  // Size of the button
                      backgroundColor: Color(0xFFF9B32D),  // Background color of the button
                      elevation: 5,  // Shadow for the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),  // Rounded corners of the button
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();  // Save form data
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),  // Show processing message
                        );
                        // Here you can handle form submission, e.g., send data to the server
                      }
                    },
                    child: Text(
                      'Signup',  // Button text
                      style: TextStyle(color: Colors.white),  // Button text color
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: TextButton(
                    onPressed: () => Get.to(() => const WelcomePage()),  // Navigation to the welcome page on button press
                    child: Text(
                      'Already have an account? Sign in',  // Button text
                      style: TextStyle(
                        color: Color(0xFF404040),  // Text color of the button
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
