import 'package:aspect_ratio_assignment/constant/string_const.dart';
import 'package:aspect_ratio_assignment/widgets/description_text_widget.dart';
import 'package:aspect_ratio_assignment/widgets/title_text_widget.dart';
import 'package:flutter/material.dart';

import 'circuler_image_portait.dart';
import 'grid_view_widget.dart';

class PortraitPage extends StatelessWidget {
  final ScrollController appBarController;

  PortraitPage({super.key, required this.appBarController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: appBarController,
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularImage(
              img: 'assets/img/profile.jpg',
            ),
          )),
          TitleText(
            title: AppString.title,
            style: TextStyle(fontSize: 19),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                child: Center(
              child: DescriptionText(
                des: AppString.Description,
                style: TextStyle(fontSize: 17),
              ),
            )),
          ),
          SizedBox(
            height: size.height,
            child: ReuseableGridView(),
          )

          //  const    SizedBox(height: 10,),
        ],

        //
      ),
    );
  }
}
