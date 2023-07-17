import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
   AppLargeText({
       this.size=30,
     required this.text,
       this.color=Colors.black,
     super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),

    );
  }
}
