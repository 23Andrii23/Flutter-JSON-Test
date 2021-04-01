
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_json/EmptyScreen/home.dart';
import 'package:flutter_app_json/user_detail.dart';
import 'package:flutter_app_json/users.dart';
import 'albums_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => UsersPage(),
        '/b': (BuildContext context) => UserDetail(),
        '/c': (BuildContext context) => AlbumsDetails(),
        '/d': (BuildContext context) => Home(),
    },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/d',
    );
  }

}