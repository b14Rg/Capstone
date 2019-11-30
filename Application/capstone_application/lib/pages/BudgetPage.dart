import 'dart:convert';
import 'dart:io';

import 'package:capstone_application/helpers/DecimalTextInputFormatter.dart';
import 'package:capstone_application/helpers/FormValidators.dart';
import 'package:capstone_application/models/budget.dart';
import 'package:capstone_application/models/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class BudgetPage extends StatefulWidget {
  final User user;

  BudgetPage({Key key, @required this.user}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState(user);
}

class _BudgetState extends State<BudgetPage> {
  User _user;
  String _dailyBudget;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _BudgetState(this._user);

  Future<void> editUser() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await _editUser(_createUser(_dailyBudget));
        Navigator.pop(context);
      } catch (e) {
        print(e.message);
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  User _createUser(budget) {
    var parseBudget = double.parse(budget);
    assert(parseBudget is double);
    User user = new User(
        id: _user.id,
        email: _user.email,
        expenses: _user.expenses,
        income: _user.income,
        budget: new Budget(id: _user.budget.id, daily: parseBudget));
    return user;
  }

  Future<http.Response> _editUser(User user) async {
    final response = await http.put(
        'https://capstone-dot-sylvan-mode-251308.appspot.com/users/${_user.id}',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(user.toJson()));
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgets'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please enter a new budget',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                'Current budget: \$${_user.budget.daily.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              TextFormField(
                validator: validateMoney,
                onSaved: (input) => _dailyBudget = input,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Daily Budget',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  color: Colors.green,
                ),
                inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton.extended(
          heroTag: 0,
          label: Text('Edit Budget'),
          onPressed: editUser,
        ),
      ),
    );
  }
}
