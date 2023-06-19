import 'package:flutter/material.dart';
import 'package:module7assigment/main.dart';

class CartPage extends StatelessWidget {
  final List<plist> products;

    CartPage({super.key, required this.products});

  int getTotalBoughtProducts() {
    int total = 0;
    for (var i in products) {
      total += i.counter;
    }
    return total;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: ${getTotalBoughtProducts()}'),
      ),
    );
  }
}