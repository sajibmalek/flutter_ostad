import 'package:aspect_ratio_assignment/constant/string_const.dart';
import 'package:aspect_ratio_assignment/widgets/circuler_image.dart';
import 'package:aspect_ratio_assignment/widgets/description_text_widget.dart';
import 'package:aspect_ratio_assignment/widgets/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'gird_view_image_child.dart';


class LandscapePage extends StatelessWidget {
  final ScrollController appBarController;

  LandscapePage({required this.appBarController, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularImage(img: "assets/img/profile.jpg"),
                )),
                SizedBox(
                  width: 10,
                ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: TitleText(
                              title: AppString.title,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DescriptionText(
                              des: AppString.Description,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: size.width,
                              child: GridView.builder(

                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount: 15,
                                  shrinkWrap: false,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(

                                      crossAxisCount: 3,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 12,
                                      mainAxisExtent: 120),
                                  itemBuilder: (context, index) =>
                                      GridViewImage(
                                      img:
                                      'assets/img/profile.jpg'))),
                        ],
                      ),
                    ),


              ],
            ),
          ],
        ),
    );

  }
}
