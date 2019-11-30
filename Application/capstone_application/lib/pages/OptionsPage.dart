import 'package:capstone_application/models/user.dart';
import 'package:capstone_application/pages/CustomDialog.dart';
import 'package:capstone_application/pages/ExpensesPage.dart';
import 'package:capstone_application/pages/SettingsPage.dart';
import 'package:flutter/material.dart';

class OptionsPage extends StatefulWidget {
  final User user;

  OptionsPage({Key key, @required this.user}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState(user);
}

class _OptionsState extends State<OptionsPage> {
  User _user;

  _OptionsState(this._user);

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
      body: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 80,
            child: FloatingActionButton.extended(
              heroTag: 2,
              label: Text('Expenses'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ExpensesPage(userExpenses: _user.expenses),
                    ));
              },
            ),
          ),
          Divider(),
          Container(
            height: 80,
            child: FloatingActionButton.extended(
              heroTag: 3,
              label: Text('Income'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                    title: 'Daily Income',
                    value: '${_user.income.daily.toStringAsFixed(2)}',
                    income: true,
                    budget: false,
                    user: _user,
                  ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 80,
            child: FloatingActionButton.extended(
              heroTag: 4,
              label: Text('Budget'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                      title: 'Daily Budget',
                      value: '${_user.budget.daily.toStringAsFixed(2)}',
                      income: false,
                      budget: true,
                      user: _user,
                    ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 80,
            child: FloatingActionButton.extended(
              heroTag: 5,
              label: Text('Settings'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(user: _user),
                    ));
              },
            ),
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton.extended(
          heroTag: 7,
          elevation: 0,
          label: Text('Sign out'),
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName('/'),
            );
          },
        ),
      ),
    );
  }
}