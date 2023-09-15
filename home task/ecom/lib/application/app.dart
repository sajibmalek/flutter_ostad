import 'package:ecom/presentation/ui/utility/colors_palatte.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../presentation/ui/screens/SplashScreen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ecommerce app",
      home: const SplashScreen() ,
      theme: ThemeData(
          primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
      ),

    );
  }
}
