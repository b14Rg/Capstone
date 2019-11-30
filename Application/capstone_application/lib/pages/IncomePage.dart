import 'package:capstone_application/models/user.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  final User user;

  IncomePage({Key key, @required this.user}) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState(user);
}

class _IncomeState extends State<IncomePage> {
  User _user;

  _IncomeState(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incomes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Text(
                'Daily',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            child: Center(
              child: Text(
                '\$${_user.income.daily.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
