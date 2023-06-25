import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module7/Task.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Module 8 Assignment",
      home: task(),
    );
  }

}