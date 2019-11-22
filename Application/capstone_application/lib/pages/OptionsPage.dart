import 'package:capstone_application/pages/ApiDemoPage.dart';
import 'package:capstone_application/pages/BudgetPage.dart';
import 'package:capstone_application/pages/ExpensesPage.dart';
import 'package:capstone_application/pages/IncomePage.dart';
import 'package:capstone_application/pages/SettingsPage.dart';
import 'package:capstone_application/pages/SummaryPage.dart';
import 'package:flutter/material.dart';



class OptionsPage extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<OptionsPage> {
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
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 40,
            child:  new FloatingActionButton.extended(
              heroTag: 1,
              label: Text('Summaries'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new SummaryPage(),
                  )
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: new FloatingActionButton.extended(
              heroTag: 2,
              label: Text('Budgets'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new BudgetPage(),
                  )
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: new FloatingActionButton.extended(
              heroTag: 3,
              label: Text('Income'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new IncomePage(),
                  )
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: new FloatingActionButton.extended(
              heroTag: 4,
              label: Text('Expenses'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new ExpensesPage(),
                  )
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: new FloatingActionButton.extended(
              heroTag: 5,
              label: Text('Settings'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new SettingsPage(),
                  )
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: new FloatingActionButton.extended(
              heroTag: 6,
              label: Text('API request Demo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new ApiDemoPage(),
                  )
                );
              },
            ),
          ),
        ],
      )
    );
  }
  
}