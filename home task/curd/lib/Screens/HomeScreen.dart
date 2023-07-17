import 'dart:convert';

import 'package:curd/Screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

bool inProgress=false;

final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();



class _HomeScreenState extends State<HomeScreen> {
  List<Product> products=[];
  final String Base_url="https://crud.teamrabbil.com/api/v1/";
  @override
  void initState() {
    super.initState();
    getProduct();
  }


  void getProduct() async{
    inProgress=true;
    setState(() {
    });
    Response response= await get(Uri.parse("$Base_url/ReadProduct"));
    // Response response=   get(Uri.parse(url)) as Response;
    final Map<String,dynamic> decodedResponse =jsonDecode(response.body);
    if(response.statusCode==200 && decodedResponse['status']=="success"){
      products.clear();
      for(var value in decodedResponse['data'] ){
        products.add(Product.toJson(value));
      }
    }
    inProgress=false;
    setState(() {
    });
  }

  void deleteProduct(String id) async{
    inProgress=true;
    setState(() {
    });
    Response response= await get(Uri.parse("$Base_url/DeleteProduct/$id"));
   dynamic decodeBody= jsonEncode(response.body);
    if(response.statusCode==200 && decodeBody['status']=="success"){
      getProduct();
    }
    else{
      inProgress=false;
      setState(() {
      });
    }


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      title: Text("CRUD App"),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){
        setState(() {
          getProduct();
        });
        }, icon: Icon(Icons.refresh))
      ],
      ),
      body: inProgress ?Center(child: CircularProgressIndicator(),):  ListView.separated(
            itemCount: products.length,
            itemBuilder: (context,index){
          return ListTile(
            onLongPress: (){
              actionDialog(context);
            },
            leading:Image.network( products[index].image,errorBuilder: (_,__,___){
              return Icon(Icons.image,size: 32,);
            },) ,
            title: Text("Product name:${products[index].productName}"),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Product Id:${products[index].id}"),
                  Text("Product code:${products[index].productCode}"),
                  Text("Total Price:${products[index].totalPrice} "),
                  Text("Available Unit: ${products[index].qty}"),
                ],
              ),
            ),
            trailing: Text("Unit price:${products[index].unitPrice}"),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),

          );
        }, separatorBuilder: (BuildContext context, int index) {
              return Divider();
        },),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          pageRoute(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
void pageRoute(context){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewProductScreen()));
}
void actionDialog(context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      titlePadding: EdgeInsets.only(left: 16,right: 10,top: 5),
      contentPadding: EdgeInsets.only(top: 8,left: 8,bottom: 8),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Choise an action"),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.cancel,color: Colors.red,))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           ListTile(
            onTap: (){

            },
            leading: Icon(Icons.edit_note),
            title: Text("Edit"),
          ),
           const Divider(height: 2,thickness: 2,),
       //   const Spacer(),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.delete_forever),
            title: Text("Delete"),
          ),
        ],
      ),
    );});
}