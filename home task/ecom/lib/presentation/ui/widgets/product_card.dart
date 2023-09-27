import 'package:ecom/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/colors_palatte.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const ProductDetailsScreen());
      },
      child: Card(
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://assorted.downloads.oppo.com/static/assets/products/oppo-watch-1/images/1920/convenience/sec1-cimg1-3ec5d106e1b4e26d9361b56dfd1f936b.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 3,),
                    Text(
                      "Nike shoe AK50450949",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(height: 8,),
                    Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                          Wrap(
                              crossAxisAlignment:
                              WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 17,
                                  color: Colors.amber,
                                ),
                                Text("4.6"),
                              ]),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          )
                        ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
