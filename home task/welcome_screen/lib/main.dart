import 'package:flutter/material.dart';
import 'package:welcome_screen/pages/nav_pages/home_page.dart';

import 'WelcomeScreen.dart';
import 'pages/nav_pages/nav_main_page.dart';


void main(){
  runApp(Welcome());
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavMainPage(),
    );
  }
}
