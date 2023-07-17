import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bar_item_page.dart';
import 'home_page.dart';
import 'my_page.dart';
import 'search_page.dart';

class NavMainPage extends StatefulWidget {
  const NavMainPage({super.key});

  @override
  State<NavMainPage> createState() => _NavMainPageState();
}

class _NavMainPageState extends State<NavMainPage> {
  List navigatePages=[
    NavHomePage(),
    BarPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navigatePages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: 0,
        selectedItemColor: Colors.black45,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.5,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.apps),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.bar_chart_sharp),label: "Bar" ),
          BottomNavigationBarItem(icon:Icon(Icons.search_sharp),label: "Search"),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: "Me" ),
        ],
      ),
    );
  }
}
