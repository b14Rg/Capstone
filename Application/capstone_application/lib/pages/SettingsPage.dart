import 'package:capstone_application/models/user.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final User user;

  SettingsPage({Key key, @required this.user}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState(user);
}

class _SettingsState extends State<SettingsPage> {
  User _user;

  _SettingsState(this._user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
                'Email',
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
                '${_user.email}',
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
