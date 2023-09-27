import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utility/colors_palatte.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedPage=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (int page, _) {
                _selectedPage.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: Image.network(
                    "https://static.gadgetandgear.com/image/250x250/fit/tmp/product/20230603_1685764180_683770.jpeg",
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),

        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedPage,
              builder: (context, value, _) {
                List<Widget> list = [];
                for (int i = 0; i < 5; i++) {
                  list.add(Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: value == i ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                     ),
                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        ),
      ],
    );
  }
}
