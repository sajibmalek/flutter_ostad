import 'package:flutter/material.dart';

class CircularImageLandView extends StatelessWidget {
   final String img;
   CircularImageLandView({
      required this.img,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 350,
      height: 350,
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
