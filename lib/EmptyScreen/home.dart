import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_json/EmptyScreen/Like.dart';
import 'package:flutter_app_json/EmptyScreen/Me.dart';
import 'package:flutter_app_json/EmptyScreen/Scanner.dart';
import 'package:flutter_app_json/EmptyScreen/Search.dart';
import 'package:flutter_app_json/users.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int index = 0;

  final screens = <Widget>[
    UsersPage(),
    Me(),
    Scanner(),
    Search(),
    Like(),
  ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: screens[index],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        color: Colors.grey,
        activeColor: Colors.black,
        top: -40,
        curveSize: 85,
        items: [
          TabItem(
              icon: Icons.home_outlined, activeIcon: Icons.home, title: "HOME"),
          TabItem(
              icon: CupertinoIcons.ticket,
              activeIcon: CupertinoIcons.ticket_fill,
              title: "DISCOUNT"),
          TabItem(
              icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Center(
                child: Icon(
              CupertinoIcons.barcode_viewfinder,
              color: Colors.white,
              size: 50,
            )),
          )),
          TabItem(
              icon: Icons.favorite_border,
              activeIcon: Icons.favorite,
              title: "FAVORITE"),
          TabItem(
              icon: Icons.more_horiz_outlined,
              activeIcon: Icons.more_horiz,
              title: "MORE"),
        ],
        initialActiveIndex: 0,
        onTap: onChangeTab,
      ),
    );
  }

  void onChangeTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}

