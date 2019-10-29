import 'package:flutter/material.dart';
import 'package:capstone_application/pages/AddExpensePage.dart';
import 'package:capstone_application/pages/OptionsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          heroTag: 0,
          elevation: 0,
          child: const Icon(Icons.list),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new OptionsPage(),
              )
            );
          },
        ),
        title: Text('Home page'),
        
      ),
      body: Center(
        child: Text(
          '-+\$200.00',
          style: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
            ),
          ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton.extended(
        heroTag: 1,
        elevation: 0,
        label: Text('Add Expense'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new AddExpensePage(),
            )
          );
        },
      ),
      ),
    );
  }
}