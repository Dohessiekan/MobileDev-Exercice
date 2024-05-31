import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),

              // logo
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 70),
                child: Image.asset(
                  'assets/images/img1.png',
                  height: 200,
                ),
              ),

              // welcome back, you've been missed

              // username textfield with title
              Padding(
                padding: const EdgeInsets.only(right: 600),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
              ),

              const SizedBox(height: 10),

              // password textfield with title
              Padding(
                padding: const EdgeInsets.only(right: 600),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0), // Réduction de 25.0 à 8.0
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0), // Réduction de 25.0 à 8.0
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onTap;

  const MyButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 215, 14),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 25.0), // Réduction de 25.0 à 8.0
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
          20), // Réduction de 20 à une valeur inférieure si nécessaire
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
