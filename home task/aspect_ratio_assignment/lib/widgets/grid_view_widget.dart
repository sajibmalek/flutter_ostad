import 'package:aspect_ratio_assignment/widgets/gird_view_image_child.dart';
import 'package:flutter/material.dart';

class ReuseableGridView extends StatelessWidget {

    ReuseableGridView({ super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / .3,
          mainAxisExtent: 120,
        ),
        itemBuilder: (context, index) =>
            GridViewImage(img: 'asstes/img/profile.jpg'));
  }
}
