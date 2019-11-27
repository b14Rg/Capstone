import 'package:capstone_application/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> loginIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()) {
      if(formState.validate()) {
        formState.save();
        try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => new HomePage(email: _email,),
          ));
        }catch(e) {
          print(e.message);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
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
                  return 'Your password needs at least 6 characters';
                }
              },
              onSaved: (passwordInput) => _password = passwordInput,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: loginIn,
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
}