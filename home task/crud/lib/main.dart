import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 

void main(){
  runApp(const app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRUD APP",
      home:  ProductGridViewScreen()
    );
  }
}
