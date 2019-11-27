import 'package:capstone_application/models/usersList.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDemoPage extends StatefulWidget {
  @override
  _ApiDemoState createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemoPage> {
  Future<UserList> users;

  @override
  void initState() {
    super.initState();
    users = _getApiData();
  }

  Future<UserList> _getApiData() async{
    final response = await http.get('https://capstone-dot-sylvan-mode-251308.appspot.com/users');

    if(response.statusCode == 200) {
      return UserList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get users');
    }
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
        title: Text('Calling api for first user'),
      ),
      body: Center(
        child: FutureBuilder<UserList>(
          future: users,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data.users[0].id.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].email.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].income.id.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].income.daily.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].budget.id.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].budget.daily.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].expenses[0].id.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].expenses[0].title.toString()),
                  Divider(),
                  Text(snapshot.data.users[0].expenses[0].total.toString()),
                  Divider()
                ],
              );
            } else if (snapshot.error) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
