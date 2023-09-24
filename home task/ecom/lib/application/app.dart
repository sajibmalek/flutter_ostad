import 'package:ecom/application/state_holder_binders.dart';
import 'package:ecom/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:ecom/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:ecom/presentation/ui/screens/check_out_screen.dart';
import 'package:ecom/presentation/ui/screens/home_screen.dart';
import 'package:ecom/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecom/presentation/ui/screens/review_screen.dart';
import 'package:ecom/presentation/ui/utility/colors_palatte.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../presentation/ui/screens/SplashScreen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ecommerce app",
      home: const SplashScreen(),
      initialBinding: StateHolderBinders(),
      theme: ThemeData(
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5)),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            disabledBorder: OutlineInputBorder(),
          )),
    );
  }
}
