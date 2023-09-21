
import 'package:ecom/presentation/ui/screens/category_list_screen.dart';
import 'package:ecom/presentation/ui/screens/product_list_screen.dart';
import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:ecom/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/CategoryCard.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/home/section_header.dart';
import '../widgets/search_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 static List<String> list=[
    'Electronics',
    'Food',
    'Fashion',
    'Furniture',
    'Home Appliance',
    'Cake',
    'Trees'
  ];
  static List<IconData> Icon_list = [
    Icons.electric_bolt,
    Icons.fastfood,
    Icons.girl,
    Icons.chair,
    Icons.home_filled,
    Icons.cake_rounded,
    Icons.account_tree_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.CraftyBayNavLogo),
            const Spacer(),
            CircularIconButton(
              onTap: () {},
              icon: Icons.person,
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              onTap: () {},
              icon: Icons.call,
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              onTap: () {},
              icon: Icons.notifications_none,
            ),
            const SizedBox(
              width: 8,
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBarTextF(),
              const SizedBox(height: 16,),
              const HomeSlider(),
              const SizedBox(height: 16,),

              SectionHeader(
                onTap: (){
                  Get.to(const CategoryListScreens());
                },
                title: "Categories",
              ),
              const SizedBox(height: 8,),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context,index){
                  return CategoryCard(Icon_list: Icon_list[index] , list: list[index]);
                }),
              ),
              SectionHeader(
                onTap: (){
                  Get.to(const ProductListScreen());
                },
                title: "Popular",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return ProductCard();
                  },
                ),
              ),
              const SizedBox(height: 8,),
              SectionHeader(
                onTap: (){
                  Get.to(const ProductListScreen());
                },
                title: "Special",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return ProductCard();
                  },
                ),
              ),
              const SizedBox(height: 8,),
              SectionHeader(
                onTap: (){
                  Get.to(const ProductListScreen());
                },
                title: "New",
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return ProductCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








