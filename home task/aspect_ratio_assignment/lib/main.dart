import 'package:aspect_ratio_assignment/widgets/change_aspect_ratio.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Ratio());
}
class Ratio extends StatefulWidget {
  const Ratio({super.key});

  @override
  State<Ratio> createState() => _RatioState();
}

class _RatioState extends State<Ratio> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Aspect Ratio",
      home: ChangeAspectRatio(),
    );
  }
}

