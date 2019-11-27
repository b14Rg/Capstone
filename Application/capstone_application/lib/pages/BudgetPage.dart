import 'package:capstone_application/models/budget.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  final Budget userBudget;

  BudgetPage({Key key, @required this.userBudget}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState(userBudget);
}

class _BudgetState extends State<BudgetPage> {
  Budget _budget;

  _BudgetState(this._budget);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgets'),
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
              child: Text('\$${_budget.daily}'),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}