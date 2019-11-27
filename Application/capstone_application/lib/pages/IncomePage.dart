import 'package:capstone_application/models/income.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  final Income userIncome;

  IncomePage({Key key, @required this.userIncome}) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState(userIncome);
}

class _IncomeState extends State<IncomePage> {
  Income _income;

  _IncomeState(this._income);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Incomes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Colors.blue,
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
              child: Text('\$${_income.daily}'),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}