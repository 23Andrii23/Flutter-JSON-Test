import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_json/EmptyScreen/Like.dart';
import 'package:flutter_app_json/EmptyScreen/Me.dart';
import 'package:flutter_app_json/EmptyScreen/Search.dart';
import 'package:flutter_app_json/bottom_bar.dart';
import 'package:flutter_app_json/users.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final screns = <Widget>[
    UsersPage(),
    Me(),
    Search(),
    Like(),
  ];

  Widget currentScreen;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screns[index],
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.barcode_viewfinder),
        onPressed: () {},
        backgroundColor: Colors.black,
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarMaterialWidget(
        index: index,
        onChangeTab: onChangeTab,
      ),
    );
  }

  void onChangeTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
