import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:ecom/presentation/ui/widgets/check_out_cart_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 1,
             crossAxisSpacing: 1,
             childAspectRatio: 1.2), itemBuilder:
           (context,index){
             return const CheckOutCartWidgest();
       }),
      ),
    );
  }
}
