import 'package:flutter/material.dart';
import 'package:module_10_assignment/widgets/title_text_widget.dart';
import '../constant/string_const.dart';
import 'circuler_image_land.dart';
import 'description_text_widget.dart';
import 'gird_view_image_child.dart';

class LandscapePage extends StatelessWidget {
  final ScrollController appBarController;

  LandscapePage({required this.appBarController, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: CircularImageLandView(img: 'assets/img/profile.jpg'),
        ),
        Expanded(
            flex: 5,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: appBarController,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      title: AppString.title,
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 10),
                    DescriptionText(
                        des: AppString.Description,
                        style: TextStyle(fontSize: 30)),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 15,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  mainAxisExtent: 150),
                          itemBuilder: (context, index) =>   GridViewImage(
                              img:"asstes/img/profile.jpg" ),
                        )),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
