import 'package:capstone_application/models/user.dart';

class UserList {
  final List<User> users;

  UserList({this.users});

  factory UserList.fromJson(List<dynamic> json) {
    List<User> users = new List<User>();
    users = json.map((i) => User.fromJson(i)).toList();

    return new UserList(
      users: users
    );
  }
}