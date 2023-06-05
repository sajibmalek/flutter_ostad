import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
    page2({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {
    return MaterialApp(title: "Page 2",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Page2Activity(),
    );

  }
}

class Page2Activity extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Page 2"),),

      body: Center(
        child: Text("Page 2"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.settings),
      ),
    );
  }}
