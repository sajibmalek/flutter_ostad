import 'package:flutter/material.dart';

class GridViewImage extends StatelessWidget {
  final String img;
  const GridViewImage({required this.img,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(image:AssetImage('assets/img/profile.jpg'),
        onError: (e,s) => Icon(Icons.image)

        ),

      ),
    );
  }
}
