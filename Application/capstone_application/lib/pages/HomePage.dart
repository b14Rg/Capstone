import 'package:capstone_application/models/user.dart';
import 'package:flutter/material.dart';
import 'package:capstone_application/pages/AddExpensePage.dart';
import 'package:capstone_application/pages/OptionsPage.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String email;

  HomePage({Key key, @required this.email}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(email);
}

class _HomePageState extends State<HomePage> {
  String email;
  double balance;
  Future<User> user;
  _HomePageState(this.email);

  @override
  void initState() {
    super.initState();
  }

  void _updateUser() async{
    user = getUserInfo();
  }

  Future<User> getUserInfo() async{
    print(email);
    final response = await http.get(
      'https://capstone-dot-sylvan-mode-251308.appspot.com/users/searchByEmail?email=$email'
    );

    if(response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get user with email: $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateUser();
    return Scaffold(
      appBar: AppBar(
        leading: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return FloatingActionButton(
                heroTag: 0,
                elevation: 0,
                child: const Icon(Icons.list),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OptionsPage(user: snapshot.data),
                    )
                  );
                },
              );
            } else if(snapshot.error) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
        title: Text('Home page'),
        
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              balance = snapshot.data.income.daily;
              if(snapshot.data.expenses != null) {
                for(var expense in snapshot.data.expenses) {
                  balance = balance - expense.total;
                }
              }
              if(balance >= snapshot.data.budget.daily) {
                return Text(
                  '+\$$balance',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                );
              } else if (balance < snapshot.data.budget.daily) {
                return Text(
                  '-\$$balance',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                );
              }
            } else if(snapshot.error) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return FloatingActionButton.extended(
                heroTag: 1,
                elevation: 0,
                label: Text('Add Expense'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddExpensePage(userId: snapshot.data.id),
                    )
                  );
                },
              );
            } else if(snapshot.error) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}