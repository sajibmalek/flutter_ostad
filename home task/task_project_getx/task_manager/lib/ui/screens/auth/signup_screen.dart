import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import '../../state_managers_controller/signup_controller.dart';
import '../../utility/string_utility.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _emailTEController = TextEditingController();

  final TextEditingController _firstNameTEController = TextEditingController();

  final TextEditingController _lastNameTEController = TextEditingController();

  final TextEditingController _mobileTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                   AppString.join_us,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return AppString.enter_email;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'First name',
                      labelText: 'First name',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return AppString.first_name;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Last name',
                      labelText: 'Last name',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return AppString.last_name;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      hintText: 'Mobile',
                      labelText: 'Mobile',
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length < 11) {
                        return AppString.enter_mobile_number;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length <= 5) {
                        return AppString.enter_password;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<SignupController>(builder: (signupController) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: signupController.signUpInProgress == false,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              signupController
                                  .userSignUp(
                                      _emailTEController.text.trim(),
                                      _firstNameTEController.text.trim(),
                                      _lastNameTEController.text.trim(),
                                      _mobileTEController.text.trim(),
                                      _passwordTEController.text)
                                  .then((value) {
                                if (value) {
                                  _emailTEController.clear();
                                  _passwordTEController.clear();
                                  _firstNameTEController.clear();
                                  _lastNameTEController.clear();
                                  _mobileTEController.clear();
                                  Get.snackbar(
                                    'Success',
                                    'Registration success!',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                } else {
                                  Get.snackbar(
                                    'Failed',
                                    'Registration failed!',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                }
                              });
                            },
                            child: const Icon(Icons.arrow_forward_ios)),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                       AppString.have_account,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, letterSpacing: 0.5),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(AppString.signIn)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
