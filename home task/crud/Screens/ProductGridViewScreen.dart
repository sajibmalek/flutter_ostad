import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../RestAPI/ModelClass/ProductList.dart';
import '../Style/Style.dart';

class ProductGridViewScreen extends StatefulWidget {


  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

bool inProgress=false;

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List<ProductList> productList=[];
  @override
  void initState() {
    super.initState();
    getProducts();
    setState(() {
    });
  }


  void getProducts()async{
    inProgress=true;
    setState(() {
    });
    const String url="https://crud.teamrabbil.com/api/v1/ReadProduct";
    Response response =await get(Uri.parse(url));
    var resCode= response.statusCode;
     var resBody=jsonDecode(response.body);
    if(resCode==200 && resBody['status']=='success'){
      SuccessToast("Request Success");
      for(var value in resBody){
        productList.add(ProductList.toJson(value));
      }
    }
    else{
      ErrorToast("Request fail! try Again");
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD App"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){
              setState(() {
                getProducts();
              });
            }, icon: Icon(Icons.refresh),color: Colors.red,),
          ),
        ],
      ),
      body:Stack(
        children: [
          ScreenBackground(context),
        inProgress? Center(child: CircularProgressIndicator(),):  GridView.builder(
              gridDelegate: ProductGridViewStyle(),
              itemCount: productList.length,
              itemBuilder: (context,index){
                return  Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child:
                      Image.network(productList[index].Img,errorBuilder: (_,__,___){
                        return const Icon(Icons.image,size: 32);
                      },
                      fit: BoxFit.fill,
                      )
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productList[index].ProductName),
                            SizedBox(height: 7),
                            Text("Price: "+productList[index].UnitPrice +" BDT"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(onPressed: (){
                                 // GotoUpdate(context,ProductList[index]);
                                }, child: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: colorGreen,)),
                                SizedBox(width: 4),
                                OutlinedButton(onPressed: (){
                                }, child: const Icon(CupertinoIcons.delete,size: 18,color: colorRed,))
                              ],
                            )

                          ],
                        ),
                      )

                    ],
                  ),
                );
              }),
        ],
      )



    );

  }
}

