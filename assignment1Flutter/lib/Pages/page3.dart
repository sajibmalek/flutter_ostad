import 'package:flutter/material.dart';

class page3 extends StatelessWidget {
   page3({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {
    return MaterialApp(title: "Page 3",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Page3Activity(),
    );

  }
}

class Page3Activity extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Page 3"),),

      body: Center(
        child: Text("Page 3"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.mail),
      ),
    );
  }}
