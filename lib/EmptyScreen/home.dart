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
        items: [
          TabItem(icon: Icons.home_outlined, title: "HOME", activeIcon: Icons.home),
          TabItem(icon: CupertinoIcons.ticket, title: "DISCOUNT", activeIcon: CupertinoIcons.ticket_fill),
          TabItem(icon: CupertinoIcons.barcode_viewfinder, ),
          TabItem(icon: Icons.favorite_border, title: "FAVORITE", activeIcon: Icons.favorite),
          TabItem(icon: Icons.more_horiz_outlined, title: "MORE", activeIcon: Icons.more_horiz),
        ],
        initialActiveIndex: 0,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
      ),

    );
  }

  void onChangeTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
