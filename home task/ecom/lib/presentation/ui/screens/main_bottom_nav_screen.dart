import 'dart:developer';

import 'package:ecom/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecom/presentation/ui/screens/category_list_screen.dart';
import 'package:ecom/presentation/ui/screens/home_screen.dart';
import 'package:ecom/presentation/ui/screens/with_list_screen.dart';
import 'package:ecom/presentation/ui/utility/colors_palatte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreens(),
    const HomeScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
      return GetBuilder<MainBottomNavController>(
        builder: (controller) {
          return Scaffold(
            body: _screens[controller.currentSelectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 4,
              currentIndex: controller.currentSelectedIndex,
              onTap: controller.changeScreen,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'home',
                    activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: 'Wishlist',
                    activeIcon: Icon(Icons.favorite))
              ],
            ),
          );
        }
      );

  }
}
