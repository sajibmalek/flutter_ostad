import 'package:email_pass_test/emailPass.dart';
import 'package:email_pass_test/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(app());
}
class app extends StatelessWidget{
  bool isSwtiched=false;

    app({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme:  ThemeClass.darkTheme,
      title: "Email and Password Validation",
      home: const emailPass(),
    );
  }

}