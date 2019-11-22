class Credentials {
  final int id;
  final String username;
  final String password;

  Credentials({this.id, this.username, this.password});

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }
}