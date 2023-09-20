import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutCartWidgest extends StatefulWidget {
  const CheckOutCartWidgest({super.key});

  @override
  State<CheckOutCartWidgest> createState() => _CheckOutCartWidgestState();
}

class _CheckOutCartWidgestState extends State<CheckOutCartWidgest> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 1,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
      //borderOnForeground: true,
      //shadowColor: Colors.cyan,
      //color: Colors.green,
      child: ListTile(
        leading: SvgPicture.asset(ImageAssets.CraftyBayLogo,width: 250,height: 250,),
        title: const Text("Product 1",style: TextStyle(
          color: Colors.black
        ),),
        subtitle: const Text("Sub title"),

      ),
    );
  }
}
