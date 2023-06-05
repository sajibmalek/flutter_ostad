import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {
    return MaterialApp(title: "Page 1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Page1Activity(),
    );

  }
}

class Page1Activity extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(title: Text("Page 1"),),
     body: Center(
       child: Text("Page 1"),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){

       },
       backgroundColor: Colors.deepOrange,
       child: Icon(Icons.add),
     ),
   );
  }}
