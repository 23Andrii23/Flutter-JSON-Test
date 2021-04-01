import 'package:flutter/foundation.dart';

class Users {
  final int id;
  final String name;
  final String username;
  final String email;

  Users({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(id: json['id'] as int,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
    );
  }
}