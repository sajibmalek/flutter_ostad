import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  final List<String> shoppingItems = [
    'Apples',
    'Bananas',
    'Oranges',
    'Milk',
    'Bread',
  ];

  @override
  Widget build(BuildContext context) {

    snackMessage(message,context,c){
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message),
            backgroundColor:  c,
            //  textColor: Colors.red,

          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shopping List'),
          centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              snackMessage("Cart is empty",context,Colors.green);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(shoppingItems[index]),
          );
        },
      ),
    );
  }
}
