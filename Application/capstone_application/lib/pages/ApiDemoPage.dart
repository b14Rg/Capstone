import 'package:capstone_application/models/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDemoPage extends StatefulWidget {
  @override
  _ApiDemoState createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemoPage> {
  Future<User> user;

  @override
  void initState() {
    super.initState();
    user = _getApiData();
  }

  Future<User> _getApiData() async{
    final response = await http.get('https://capstone-dot-sylvan-mode-251308.appspot.com/users/4');

    if(response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get user');
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
        title: Text('Calling api for one user'),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data.id.toString()),
                  Divider(),
                  Text(snapshot.data.name.toString()),
                  Divider(),
                  Text(snapshot.data.email.toString()),
                  Divider(),
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
