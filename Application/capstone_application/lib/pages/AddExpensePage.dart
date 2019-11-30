import 'dart:convert';
import 'dart:io';

import 'package:capstone_application/helpers/DecimalTextInputFormatter.dart';
import 'package:capstone_application/helpers/FormValidators.dart';
import 'package:capstone_application/models/expense.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AddExpensePage extends StatefulWidget {
  final int userId;

  AddExpensePage({Key key, @required this.userId}) : super(key: key);

  @override
  _AddExpenseState createState() => _AddExpenseState(userId);
}

class _AddExpenseState extends State<AddExpensePage> {
  int _userId;
  String _title;
  double _total;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _AddExpenseState(this._userId);

  Future<void> addExpense() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await _saveExpenseToUser(_userId, _createExpense(_title, _total));
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

  Expense _createExpense(title, total) {
    Expense expense = new Expense(id: 0, title: title, total: total);
    return expense;
  }

  Future<void> _saveExpenseToUser(userId, Expense expense) async {
    final response = await http.post(
        'https://capstone-dot-sylvan-mode-251308.appspot.com/expenses/$userId',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(expense.toJson()));
    return response;
  }

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
        title: Text('Expense'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: validateText,
                onSaved: (titleInput) => _title = titleInput,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              TextFormField(
                validator: validateMoney,
                onSaved: (totalInput) => _total = double.parse(totalInput),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Total',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  color: Colors.green,
                ),
                inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton.extended(
          heroTag: 2,
          elevation: 0,
          label: Text('Add'),
          onPressed: addExpense,
        ),
      ),
    );
  }
}
