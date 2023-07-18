import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
   final String img;
    CircularImage({
      required this.img,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(img),
              onError: (e,stacktrace) => Icon(Icons.image),
              fit: BoxFit.cover
        )
      ),


    );
  }
}
