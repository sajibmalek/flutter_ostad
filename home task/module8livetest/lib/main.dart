import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main(){
  runApp(app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Module 8 live test",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
