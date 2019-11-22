import 'package:capstone_application/pages/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> register() async {
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage(),
          ));
      }catch(e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (email_input) {
                if(email_input.isEmpty) {
                  return 'Please enter an email';
                }
              },
              onSaved: (emailInput) => _email = emailInput,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (password_input) {
                if(password_input.length < 4) {
                  return 'Your pass word needs at least 6 characters';
                }
              },
              onSaved: (passwordInput) => _password = passwordInput,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: register,
              child: Text('Resigter'),
            )
          ],
        ),
      ),
    );
  }
}