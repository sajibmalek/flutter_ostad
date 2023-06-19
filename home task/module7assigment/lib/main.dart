
import 'package:flutter/material.dart';
import 'package:module7assigment/CartPage.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Product List",
      home: productList(),
    );
  }
}
class plist{

  final String name;
  final double price;
  int counter=0;

  plist({required this.name,required this.price, this.counter=0});

}
class productList extends StatefulWidget {
    productList({super.key});

  @override
  State<productList> createState() => _productListState();
}

class _productListState extends State<productList> {

  List<plist> products = [
    plist(name: 'Product 1', price: 10.0),
    plist(name: 'Product 2', price: 15.0),
    plist(name: 'Product 3', price: 20.0),
    plist(name: "product 4", price: 19.0),
    plist(name: "product 5", price: 80.0),
    plist(name: "product 6", price: 39.0),
    plist(name: "product 7", price: 29.0),
     
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
          itemBuilder:(context,index){
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text("\$ ${products[index].price.toStringAsFixed(2)}"),
            trailing: Column(
              children: [
                Text("Counter ${products[index].counter}"),
                TextButton(onPressed: (){
                  setState(() {

                     products[index].counter++;
                     if(products[index].counter==5){

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Congratulations!'),
                          content: Text('You\'ve bought 5 ${products[index].name}!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );

                        }
                  });
                },child: Text("Buy Now",style: TextStyle(
                  color: Colors.white
                ),),style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),),
              ],
            ),
          );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (c)=>CartPage(products: products)));
        },

       child: Icon(Icons.shopping_cart),
      ),

    );
  }
}
