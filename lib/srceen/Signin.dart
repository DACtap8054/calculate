import 'package:calculate/srceen/program.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Sign in successful, navigate to the next screen or perform any other actions.
      print('Sign in successful');

      // Navigate to the next screen (replace 'NextScreen' with the name of your next screen)
      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => UserProfile(email: 'your_email@example.com'),
  ),
);
    } catch (e) {
      // Handle sign in errors, for example, incorrect email or password.
      print('Error during sign in: $e');
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Email หรือ password ของคุณไม่ถูกต้อง กรุณาลงทะเบียนใหม่',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 0,
              left: 2,
              child: Image.asset(
                'assets/images/5.png',
                width: 370,
                height: 130,
              ),
            ),
            Positioned(
              top: 0,
              left: 160,
              child: Image.asset(
                'assets/images/Group-9.png',
                width: 55,
                height: 130,
              ),
            ),
            // Add buttons in the app bar
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Group-7.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
