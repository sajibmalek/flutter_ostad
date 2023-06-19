import 'package:flutter/material.dart';

class SecondScreen  extends StatelessWidget {
  const SecondScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: secondScreen(),
    );
  }
}
class secondScreen extends StatefulWidget {
  const secondScreen({super.key});

  @override
  State<secondScreen> createState() => _secondScreenState();
}

class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: Center(
          child: Text("Congratulations! You reached 10!",style: TextStyle(
            fontSize: 24
          ),)),
    );

  }

}



