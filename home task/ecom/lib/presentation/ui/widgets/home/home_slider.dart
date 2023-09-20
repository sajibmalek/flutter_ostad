import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utility/colors_palatte.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedPage=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (int page, _) {
                _selectedPage.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                // return Container(
                //     width: MediaQuery.of(context).size.width,
                //     margin: EdgeInsets.symmetric(horizontal: 5.0),
                //     decoration: BoxDecoration(color: Colors.amber),
                //     child: Text(
                //       'text $i',
                //       style: TextStyle(fontSize: 16.0),
                //     ));
                return SvgPicture.asset(ImageAssets.CraftyBayLogo,width: MediaQuery.of(context).size.width,);
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedPage,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < 5; i++) {
                list.add(Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: value == i ? AppColors.primaryColor : null,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            }),
      ],
    );
  }
}
