import 'dart:convert';
import 'package:flutter_app_json/Model/user_model.dart';
import 'package:http/http.dart';

class HttpServiceUser {

  final usersUrl = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<Users>> getUsers() async {
    Response res = await get(usersUrl);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Users> users = body.map((dynamic item) => Users.fromJson(item)).toList();

      return users;
    } else {
      throw "Can't get users";
    }
  }
}