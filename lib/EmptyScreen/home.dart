import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_json/EmptyScreen/Like.dart';
import 'package:flutter_app_json/EmptyScreen/Me.dart';
import 'package:flutter_app_json/EmptyScreen/Scanner.dart';
import 'package:flutter_app_json/EmptyScreen/Search.dart';
import 'package:flutter_app_json/users.dart';

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
      backgroundColor: Colors.blueAccent,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              index = 2;
              onChangeTab(index);
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                  color: Colors.black),
              child: Icon(CupertinoIcons.barcode_viewfinder, size: 40),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new Container(
        //height: 80.0,
        color: Colors.white,
        child: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.black,
              bottomAppBarColor: Colors.green,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))),
          // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: index,
              onTap: onChangeTab,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    label: 'HOME',
                    activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.ticket,
                    ),
                    label: 'DISCOUNT',
                    activeIcon: Icon(CupertinoIcons.ticket_fill)),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.transparent,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: 'FAVORITE',
                    activeIcon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz_outlined),
                    label: 'MORE',
                    activeIcon: Icon(Icons.more_horiz)),
              ]),
        ),
      ),
    );
  }

  void onChangeTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
