import 'package:ecom/presentation/ui/screens/category_list_screen.dart';
import 'package:ecom/presentation/ui/screens/home_screen.dart';
import 'package:ecom/presentation/ui/screens/with_list_screen.dart';
import 'package:ecom/presentation/ui/utility/colors_palatte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex=0;

  final List<Widget> _screens=[
    const HomeScreen(),
    const CategoryListScreens(),
    const HomeScreen(),
    const WishListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 4,
        currentIndex: _selectedIndex,
        onTap: (int index){
          _selectedIndex=index;
          if(mounted){
            setState(() {
            });
          }

        },
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'home',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Wishlist',activeIcon: Icon(Icons.favorite))
        ],

      ),
    );
  }
}
