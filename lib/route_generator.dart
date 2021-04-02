import 'package:flutter/material.dart';
import 'package:flutter_app_json/Constants/constants.dart';
import 'package:flutter_app_json/EmptyScreen/home.dart';
import 'package:flutter_app_json/Model/albums_model.dart';
import 'package:flutter_app_json/Model/user_model.dart';
import 'package:flutter_app_json/albums_detail.dart';
import 'package:flutter_app_json/user_detail.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Constant.firstScreen:
        return MaterialPageRoute(builder: (_) => Home());
      case Constant.albums:
        if (args is Users) {
          return MaterialPageRoute(
            builder: (_) => UserDetail(
              users: args,
            ),
          );
        }
        return _errorRoute();
      case Constant.photo:
        if (args is Albums) {
          return MaterialPageRoute(
            builder: (_) => AlbumsDetails(
              albums: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  });
}