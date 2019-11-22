import 'package:capstone_application/models/credentials.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Credentials credentials;

  User({this.id, this.name, this.email, this.credentials});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}