import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curd App",
      home: HomeScreen(),
    );
  }
}
