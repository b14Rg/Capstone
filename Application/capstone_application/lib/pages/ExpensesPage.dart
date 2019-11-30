import 'package:capstone_application/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  final List<Expense> userExpenses;

  ExpensesPage({Key key, @required this.userExpenses}) : super(key: key);
  @override
  _ExpensesState createState() => _ExpensesState(userExpenses);
}

class _ExpensesState extends State<ExpensesPage> {
  List<Expense> _expenses;

  _ExpensesState(this._expenses);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: _buildExpenses(),
    );
  }

  Widget _buildExpenses() {
    return ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: _expenses.length,
      itemBuilder: (context, i) {
        if (i < _expenses.length) {
          return _buildExpense(_expenses[i]);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildExpense(Expense expense) {
    return new ListTile(
      title: Text(
        expense.title + '\t\t${expense.total.toStringAsFixed(2)}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
