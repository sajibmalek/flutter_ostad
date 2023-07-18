import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
   String des;
   dynamic style;
    DescriptionText({ required this.des, required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(des,
    style: style
    );
  }
}
