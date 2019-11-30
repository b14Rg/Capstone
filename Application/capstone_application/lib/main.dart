import 'package:capstone_application/pages/WelcomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NU Budget',
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.grey[800],
        bottomAppBarColor: Colors.grey[800],
      ),
      home: WelcomePage(),
    );
  }
}
