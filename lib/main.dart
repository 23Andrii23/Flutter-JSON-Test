
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_json/route_generator.dart';
import 'package:flutter_app_json/Constants/constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Constant.firstScreen,
      onGenerateRoute: RouteGenerator.generatorRoute,
    );
  }
}

