import 'dart:convert';
import 'dart:io';

import 'package:capstone_application/helpers/DecimalTextInputFormatter.dart';
import 'package:capstone_application/models/budget.dart';
import 'package:capstone_application/models/expense.dart';
import 'package:capstone_application/models/income.dart';
import 'package:capstone_application/models/user.dart';
import 'package:capstone_application/pages/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  String _email, _password, _income, _budget;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> register() async {
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        await _saveUser(_createUser(_email, _income, _budget));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage(),
          ));
      }catch(e) {
        print(e.message);
      }
    }
  }

  User _createUser(email, income, budget) {
    var parseIncome = double.parse(income);
    var parseBudget = double.parse(budget);
    assert(parseIncome is double);
    assert(parseBudget is double);
    User user = new User(
      id: 0,
      email: email,
      expenses: new List<Expense>(),
      income: new Income(
        id: 0,
        daily: parseIncome
      ),
      budget: new Budget(
        id: 0,
        daily: parseBudget
      )
    );
    return user;
  }

  Future<http.Response> _saveUser(User user) async {
    final response = await http.post(
      'https://capstone-dot-sylvan-mode-251308.appspot.com/users',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: json.encode(user.toJson())
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (email_input) {
                if(email_input.isEmpty) {
                  return 'Please enter an email';
                }
              },
              onSaved: (emailInput) => _email = emailInput,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (password_input) {
                if(password_input.length < 4) {
                  return 'Your pass word needs at least 6 characters';
                }
              },
              onSaved: (passwordInput) => _password = passwordInput,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            TextFormField(
              validator: (income_input) {
                // if(income_input.length < 4) {
                //   return 'Your pass word needs at least 6 characters';
                // }
              },
              onSaved: (incomeInput) => _income = incomeInput,
              decoration: InputDecoration(
                labelText: 'Incom'
              ),
              inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              validator: (budget_input) {
                // if(budget_input.length < 4) {
                //   return 'Your pass word needs at least 6 characters';
                // }
              },
              onSaved: (budgetInput) => _budget = budgetInput,
              decoration: InputDecoration(
                labelText: 'Budget'
              ),
              inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
              height: 80,
              child: FloatingActionButton.extended(
                heroTag: 0,
                label: Text('Register'),
                onPressed: register,
              ),
            )
          ],
        ),
      ),
    );
  }
}