import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';

import '../../widgets/reusable_background.dart';
import '../utility/assets_utility/string_utility.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

final _setPasswordController=TextEditingController();
final _setPasswordConfirmController=TextEditingController();
final _setPasswordKey= GlobalKey<FormState>();

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(

        children: [
          const Expanded( flex:1, child: AppBackGround()),
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key:_setPasswordKey ,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 40 ,top: 170,bottom: 8),
                      child: const Text(
                        AppString.set_paswword,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 80, right: 50,top: 10,bottom: 15),
                        child: const Text(
                          AppString.minimum_length,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),
                        ),
                    ),
                    Container(
                      width: 310,
                      margin:
                      const   EdgeInsets.only( left: 64, right: 35, bottom: 15),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your password";
                          }
                          if (value?.trim().length!=6) {
                            return "Enter the minimum 6 digits";
                          }
                          if (mounted) {
                            setState(() {});
                          }
                          return null;
                        },
                        controller: _setPasswordController,
                        decoration: InputDecoration(

                            label: const Text("Password"),
                            prefixIconColor: Colors.green,
                           // prefixText: "*******",
                            hintText: "*******",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.password,
                                size: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    Container(

                      width: 310,
                      margin:
                      const   EdgeInsets.only( left: 64, right: 35, bottom: 15),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true ) {
                            return   "Enter the minimum 6 digits";
                          }
                          if (value?.trim().toString()!=_setPasswordController.text) {
                            return "Password are not same.";
                          }
                          if (mounted) {
                            setState(() {});
                          }
                          return null;
                        },
                        controller: _setPasswordConfirmController,
                        decoration: InputDecoration(
                          //contentPadding:EdgeInsets.only(),
                          // hintText: "exmaple@gmail.com",
                            label: const Text("Confirm Password"),
                            prefixIconColor: Colors.green,
                            //prefixText: "*******",
                            hintText: "******",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.password,
                                size: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    InkWell(
                      splashColor:Colors.indigo,
                      onTap: () {
                        if(_setPasswordKey.currentState!.validate()){
                          print(_setPasswordController.text);
                          print(_setPasswordConfirmController.text);
                          if(mounted){
                            setState(() {
                            });
                          }
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 68, right: 40),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        width: 310,
                        height: 40,
                        child: const Center(
                          child: Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const   SizedBox(height: 20,),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12, right: 5),
                          child: Text(
                            AppString.dont_account,
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding:   EdgeInsets.only(bottom: 12, right: 1),
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()), (route) => false);
                            },
                            child: Text(
                              AppString.signUp,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
          //top text container

          //sub text container

        ],
      ) ,
    );
  }
}
