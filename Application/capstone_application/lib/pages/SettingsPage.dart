import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          heroTag: 0,
          elevation: 0,
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Options'),
      ),
      body: ListView (
        padding: const EdgeInsets.all(25.0),
        children: <Widget>[
          Container(
            height: 150,
            child: const Center(
              child: Text('Summaries'),
            ),
          ),
          Divider(),
          Container(
            height: 150,
            child: const Center(
              child: Text('Budgets'),
            ),
          ),
          Divider(),
          Container(
            height: 150,
            child: const Center(
              child: Text('Income'),
            ),
          ),
          Divider(),
          Container(
            height: 150,
            child: const Center(
              child: Text('Expenses'),
            ),
          ),
          Divider(),
          Container(
            height: 150,
            child: const Center(
              child: Text('Settings'),
            ),
          ),
        ],
      )
    );
  }
}