import 'package:flutter/material.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        color: Color(0xFFF5F5F5), // Couleur de fond de la page
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 150, // Taille du logo agrandie
                  ),
                ),
                SizedBox(height: 16.0), // Réduction de l'espace entre le logo et le formulaire
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384), // Couleur du texte
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value ?? '';
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384), // Couleur du texte
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value ?? '';
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384), // Couleur du texte
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value ?? '';
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF303384), // Couleur du texte
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFDADADA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value ?? '';
                  },
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFFF8B22A)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(8.0), // Effet d'ombre portée
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),
                        );
                        // Here you can handle the form submission, e.g., send data to the server
                      }
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white), // Texte en blanc
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle sign in
                    },
                    child: Text(
                      'Already have an account? Sign in',
                      style: TextStyle(
                        color: Color(0xFF404040), // Couleur du texte en bas du bouton
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