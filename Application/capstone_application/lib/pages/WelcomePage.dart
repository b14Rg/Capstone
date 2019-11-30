import 'package:capstone_application/pages/LoginPage.dart';
import 'package:capstone_application/pages/RegisterPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomePage> {
  void navigateSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
        fullscreenDialog: true,
      ),
    );
  }

  void navigateSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
          fullscreenDialog: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton.extended(
              heroTag: 0,
              onPressed: navigateSignIn,
              label: Text('Sign in'),
            ),
            FloatingActionButton.extended(
              heroTag: 1,
              onPressed: navigateSignUp,
              label: Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
