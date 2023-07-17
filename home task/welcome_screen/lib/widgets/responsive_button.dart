import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive=false;
  double? width;
  ResponsiveButton({
    this.isResponsive,
    this.width,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.indigo
      ),
          width: width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.navigate_next,size: 32,color: Colors.white,)

        ],
      ),
    );
  }
}
