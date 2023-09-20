import 'dart:async';

import 'package:ecom/presentation/ui/screens/complete_profile_screen.dart';
import 'package:ecom/presentation/ui/utility/colors_palatte.dart';
import 'package:ecom/presentation/ui/utility/strings_assets.dart';
import 'package:ecom/presentation/ui/widgets/otp_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late Timer _timer;
  int _start=10;
  void OtpCountdown(){
    const oneSec=Duration(seconds: 1);
    _timer=Timer.periodic(oneSec, (Timer timer) {
      if(_start==0){
        setState(() {
          _timer.cancel();
        });
      }else{
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    OtpCountdown();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                    child:
                        SvgPicture.asset(ImageAssets.CraftyBayLogo, width: 100)),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  StringsAssets.OtpPageTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(StringsAssets.OtpPageSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 16,
                ),

             OtpFiled(),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(const CompleteProfileScreen());
                        }, child: const Text("Verify"))),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text:TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(text: StringsAssets.expireCode),
                        TextSpan(
                          text:"${_start.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 4,
                ),
               _start==0? TextButton(
                  onPressed: () {},
                  child: Text("Resend"),
                  style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
                ):TextButton(
                 onPressed: () {},
                 child: Text("Resend"),
                 style: TextButton.styleFrom(   foregroundColor: Colors.grey,),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
