import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  AppText({
    this.size=16,
    required this.text,
    this.color=Colors.black45,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
      ),

    );
  }
}
