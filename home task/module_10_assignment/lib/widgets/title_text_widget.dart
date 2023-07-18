import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
   final String title;
  final   dynamic style;
   TitleText({required this.title, required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style:style);
  }
}
