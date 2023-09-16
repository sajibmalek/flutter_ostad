import 'package:ecom/presentation/ui/utility/colors_palatte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFiled extends StatefulWidget {
  const OtpFiled({super.key});

  @override
  State<OtpFiled> createState() => _OtpFiledState();
}

class _OtpFiledState extends State<OtpFiled> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
            inactiveFillColor:  Colors.white,
          selectedFillColor: Colors.white,
          activeColor:AppColors.primaryColor,
          inactiveColor:  AppColors.primaryColor,
          selectedColor: Colors.green

        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
         onCompleted: (v) {

        },
        onChanged: (value) {

        },
        beforeTextPaste: (text) {
         return true;
        }, appContext: context,
      );
  }
}
