import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/widgets/reusable_background.dart';
import 'package:task_manager/widgets/user_profile_banner.dart';

import '../utility/assets_utility/string_utility.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {



  static const String _validMail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String _validNumber = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final _update_emailController = TextEditingController();
  final _update_firstNameController = TextEditingController();
  final _update_lastNameController = TextEditingController();
  final _update_mobileNumberController = TextEditingController();
  final _update_passwordController = TextEditingController();
  final _updateProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child:
            Stack(
              children: [
              const  AppBackGround(),
                Column(
                  children: [
                    const userProfileBanner(),
                  const  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 76,
                          height: 40,
                          child: Center(
                            child: Text("Photo"),
                          ),
                        ),
                        SizedBox(
                          width: 280,
                          height: 40,
                        )
                      ],
                    ),
                    Form(
                      key: _updateProfileFormKey,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 0, right: 40, top: 100, bottom: 20),
                            child: const Text(
                              AppString.update_profile,
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            width: 310,
                            margin:
                            const EdgeInsets.only(left: 64, right: 35, bottom: 15),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value
                                    ?.trim()
                                    .isEmpty ?? true) {
                                  return AppString.enter_email;
                                }
                                if (!RegExp(_validMail).hasMatch(value.toString())) {
                                  return AppString.enter_valid_email;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                                return null;
                              },
                              controller: _update_emailController,
                              decoration: InputDecoration(
                                  label: const Text("Email"),
                                  prefixIconColor: Colors.green,
                                  // prefixText: "*******",
                                  hintText: "example@gmail.com",
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.email,
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
                            const EdgeInsets.only(left: 64, right: 35, bottom: 15),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value
                                    ?.trim()
                                    .isEmpty ?? true) {
                                  return AppString.first_name;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                                return null;
                              },
                              controller: _update_firstNameController,
                              decoration: InputDecoration(
                                  label: const Text("First Name"),
                                  prefixIconColor: Colors.green,
                                  // prefixText: "*******",
                                  hintText: "sajib",
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person,
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
                            const EdgeInsets.only(left: 64, right: 35, bottom: 15),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value
                                    ?.trim()
                                    .isEmpty ?? true) {
                                  return AppString.last_name;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                                return null;
                              },
                              controller: _update_lastNameController,
                              decoration: InputDecoration(
                                  label: const Text("Last Name"),
                                  prefixIconColor: Colors.green,
                                  // prefixText: "*******",
                                  hintText: "A. Malek",
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person,
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
                            const EdgeInsets.only(left: 64, right: 35, bottom: 15),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value
                                    ?.trim()
                                    .isEmpty ?? true) {
                                  return AppString.enter_mobile_number;
                                }
                                if (!RegExp(_validNumber).hasMatch(
                                    value.toString())) {
                                  return AppString.enter_valid_number;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                                return null;
                              },
                              controller: _update_mobileNumberController,
                              decoration: InputDecoration(
                                  label: const Text("Mobile Number"),
                                  prefixIconColor: Colors.green,
                                  // prefixText: "*******",
                                  hintText: "0171234xxxix",
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.phone_android,
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
                            const EdgeInsets.only(left: 64, right: 35, bottom: 15),
                            child: TextFormField(
                              obscureText: true,
                              validator: (String? value) {
                                if (value
                                    ?.trim()
                                    .isEmpty ?? true) {
                                  return AppString.enter_password;
                                }
                                if (value!.length <= 8) {
                                  return AppString.minimum_length;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                                return null;
                              },
                              controller: _update_passwordController,
                              decoration: InputDecoration(
                                  filled: true,
                                  focusColor: Colors.white,
                                  label: const Text("Password"),
                                  prefixIconColor: Colors.green,
                                  // prefixText: "*******",
                                  hintText: "********",
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
                          Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 40,
                              width: 310,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_updateProfileFormKey.currentState!.validate()) {

                                    if (mounted) {
                                      setState(() {});
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),



      ),
    );
  }
}
