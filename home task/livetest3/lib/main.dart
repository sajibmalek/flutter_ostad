import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Shopping List",
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});
  snackMessage(message,context,c){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message),
          backgroundColor:  c,
          //  textColor: Colors.red,

        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("My Shopping List"),
  centerTitle: true,
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: (){
        snackMessage("Cart is empty",context,Colors.green);
      }, icon:Icon(Icons.shopping_cart)),
    )
  ],
),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Apples",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Bananas",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Bread",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Milk",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Eggs",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
            ),
          ),
        ],
      ),
    );
  }
}
