import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_border.dart' show InputBorder, OutlineInputBorder;

class emailPass extends StatefulWidget {
  const emailPass({super.key});

  @override
  State<emailPass> createState() => _emailPassState();
}

class _emailPassState extends State<emailPass> {
  //late TextEditingController _emailController,_passwordController=TextEditingController();
   final TextEditingController _emailController=TextEditingController();
   final TextEditingController _passwordController=TextEditingController();
   final _logingForm= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email & password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("Welcome to Eshopraj.com",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                shadowColor: Color.fromRGBO(33, 191, 115, 1),
                color: Colors.white,
                elevation: 8,
                child: Expanded(
                  child: SizedBox(
                    height: 350,
                   // width: 200,
                    child:  Center(
                      child: Form(
                        key: _logingForm,
                        child: Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                              child: TextFormField(
                                controller: _emailController,
                                  validator: (String ? value){
                                  if(value?.trim().isEmpty??true){
                                    return 'This field is required';
                                  }
                                  final String email=r'\S+@\S+\.\S+';
                                  if(!RegExp(email).hasMatch(value.toString())){
                                    return "Please enter a valid email address";
                                  }
                                  if(mounted){
                                    setState(() {
                                    });
                                  }
                                  return null;
                                    },
                                  // ignore: prefer_const_constructors
                                  decoration: InputDecoration(
                                 //   focusedBorder: InputBorder(),
                                      // enabledBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(width: 2, color: Colors.green),
                                      //   borderRadius: BorderRadius.all(Radius.circular(10))
                                      // ),
                                    icon: Icon(Icons.email_outlined,color: Colors.green,),
                                    label: Text("Email"),
                                    hintText: "example@gmail.com",
                                    hoverColor: Colors.deepOrange,
                                     focusColor: Colors.deepOrange,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      gapPadding: 1,
                                    )
                                  ),
                              ),
                            ),
                            Padding(
                              padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (String? value){
                                  if(value?.trim().isEmpty??true){
                                    return "Enter your password";
                                  }
                                  // if(value!.trim().isNotEmpty && value?.trim().length !=6){
                                  //   return "Password must be 6 letters";
                                  //
                                  // }

                               else if(value?.trim().length !=6){
                                    return "Password must be 6 letters";

                                  }
                                  return null;
                                  if(mounted){
                                    setState(() {
                                    });
                                  }

                                  // if(mounted){
                                  //   setState(() {
                                  //   });
                                  // }

                                },
                                obscureText: true,
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  //   focusedBorder: InputBorder(),
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(width: 2, color: Colors.green),
                                  //   borderRadius: BorderRadius.all(Radius.circular(10))
                                  // ),
                                    icon: Icon(Icons.password,color: Colors.green,),
                                    label: Text("Password"),
                                    hintText: "*******",
                                    hoverColor: Colors.deepOrange,
                                    focusColor: Colors.deepOrange,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      gapPadding: 1,
                                    )
                                ),
                              ),
                            ),
                             Padding(
                               padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                               child: ElevatedButton(onPressed: (){
                                 if(_logingForm.currentState!.validate()){

                                 }
                                 if(mounted){
                                   setState(() {
                                   });
                                 }
                               }, child: Text("Login")),
                             ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("E-mail: ${_emailController.text}"),
                        ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Password: ${_passwordController.text}"),
                            ),

                          ],
                        ),
                      ),
                    )
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
