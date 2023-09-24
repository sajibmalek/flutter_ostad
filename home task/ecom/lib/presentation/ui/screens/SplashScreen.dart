import 'package:ecom/presentation/ui/screens/home_screen.dart';
import 'package:ecom/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }
  void navigate(){
    Future.delayed(const Duration(seconds: 2)).then((value){
      //Default way
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeScreen()), (route) => false);
      //Getx
      // flat principal??
      //layering arct??
      //ans: now we are using this
    // nvc ?? mvc??
      Get.offAll(const MainBottomNavScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: SvgPicture.asset(ImageAssets.CraftyBayLogo, width: 100)),
          const Spacer(),
          const SizedBox(
              width: 25, height: 25, child: CircularProgressIndicator()),
          const SizedBox(
            height: 16,
          ),
           const Text('version 1.0.0'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
