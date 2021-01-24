import "package:flutter/material.dart";

import '../home_screen/home_screen.dart';
import '../history_screen/history_screen.dart';

import "package:hexcolor/hexcolor.dart";

class Tabs extends StatefulWidget {

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  List<Map<String, Object>> _tabsScreen;
  var _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabsScreen = [
      {
        "page": HomeScreen(),
        "title": "Bill Splitter",
      },
      {
        "page": HistoryScreen(),
        "title": "History",
      },
    ];
  }

  void _selectedPage(int index) {

    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_tabsScreen[_selectedPageIndex]["title"]),
      //   backgroundColor: Colors.blue,
      //   // flexibleSpace: Container(
      //   //   decoration: BoxDecoration(
      //   //     gradient: LinearGradient(
      //   //       colors: [
      //   //       HexColor("#4B6CB7"),
      //   //       HexColor("#182848"),
      //   //     ],
      //   //     begin: Alignment.topCenter,
      //   //     end: Alignment.bottomCenter,
      //   //     ),
      //   //   ),
      //   // ),
      //   elevation: 0,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Theme.of(context).primaryColor,
            label: "Home", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            backgroundColor: Theme.of(context).primaryColor,
            label: "History",
          ),
        ],
      ),
      body: _tabsScreen[_selectedPageIndex]["page"],
    );
  }
}