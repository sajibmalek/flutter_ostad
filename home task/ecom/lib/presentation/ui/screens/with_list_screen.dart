import 'package:ecom/presentation/ui/widgets/CategoryCard.dart';
import 'package:ecom/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}
List<String> list=[
  'Electronics',
  'Food',
  'Fashion',
  'Furniture',
  'Home Appliance',
  'Cake',
  'Trees'
      'Furniture',
  'Home Appliance',
  'Cake',
  'Trees'
];

List<IconData> Icon_list = [
  Icons.electric_bolt,
  Icons.fastfood,
  Icons.girl,
  Icons.chair,
  Icons.home_filled,
  Icons.cake_rounded,
  Icons.account_tree_outlined,
  Icons.chair,
  Icons.home_filled,
  Icons.cake_rounded,
  Icons.account_tree_outlined,
];

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("WishList",style: TextStyle(
            color: Colors.black
        ),),
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: GridView.builder(
            itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCard());
            }),
      ),
    );
  }
}
