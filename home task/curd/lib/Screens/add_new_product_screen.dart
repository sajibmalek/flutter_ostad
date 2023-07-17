import 'dart:convert';
import 'dart:js';

import 'package:curd/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductState();
}
final _pForm = GlobalKey<FormState>();
final TextEditingController productNameController = TextEditingController();
final TextEditingController productCodeController = TextEditingController();
final TextEditingController imageUrlController = TextEditingController();
final TextEditingController unitPriceController = TextEditingController();
final TextEditingController qtyController = TextEditingController();
final TextEditingController totalPriceController = TextEditingController();
bool inProgress=false;



class _AddNewProductState extends State<AddNewProductScreen> {

  void postProduct(context) async{
    inProgress=true;
    if(mounted){
      setState(() {
      });
    }
    const String url='https://crud.teamrabbil.com/api/v1/CreateProduct';
    Response response=await post(Uri.parse(url),
        headers: {
          'Content-Type':'application/json',
        },
        body: jsonEncode({
          "ProductName": productNameController.text.toString(),
          "ProductCode": productCodeController.text.toString(),
          "Img": imageUrlController.text.toString(),
          "UnitPrice": unitPriceController.text.toString(),
          "Qty": qtyController.text.toString(),
          "TotalPrice": totalPriceController.text.toString()
        }
        )
    );

    inProgress=false;
    if(mounted){
      setState(() {
      });
    }
    if(response.statusCode==200){

      final decodeBody= jsonDecode( response.body);
      if(decodeBody['status']=='success'){

        productNameController.clear();
        productCodeController.clear();
        imageUrlController.clear();
        unitPriceController.clear();
        qtyController.clear();
        totalPriceController.clear();

        Fluttertoast.showToast(
            msg: "success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
      }
      inProgress=true;
    }
    else{
      Fluttertoast.showToast(
          msg: "try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _pForm,
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value
                      ?.trim()
                      .toString()
                      .isEmpty ?? true) {
                    return "Enter your Product name";
                  }
                  return null;
                },
                controller: productNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'ProductName',
                ),),
              SizedBox(height: 10,),
              TextFormField(
                validator: (String? value) {
                  if (value
                      ?.trim()
                      .toString()
                      .isEmpty ?? true) {
                    return "Enter your product Code";
                  }
                  return null;
                },
                controller: productCodeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'ProductCode',
                ),),
              SizedBox(height: 10,),
              TextFormField(
                validator: (String ?value) {
                  if (value
                      ?.trim()
                      .toString()
                      .isEmpty ?? true) {
                    return "Enter the image url";
                  }
                  return null;
                },
                controller: imageUrlController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Imgage Url',
                ),),
              SizedBox(height: 10,),
              TextFormField(
                validator: (String ?value) {
                  if (value
                      ?.trim()
                      .toString()
                      .isEmpty ?? true) {
                    return "Enter your uint price";
                  }
                  return null;
                },
                controller: unitPriceController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'UnitPrice',
                ),),
              SizedBox(height: 10,),
              TextFormField(
                validator: (String ?value) {
                  if (value
                      ?.trim()
                      .toString()
                      .isEmpty ?? true) {
                    return "Enter your qty.";
                  }
                  return null;
                },
                controller: qtyController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Qty',
                ),),
              SizedBox(height: 10,),
              TextFormField(
                validator: (String ?value) {
                  if (value
                      ?.trim()
                      .toString()
                      .isEmpty ?? true) {
                    return "Enter your total price";
                  }
                  return null;
                },
                controller: totalPriceController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'TotalPrice',
                ),),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:inProgress? Center(child: CircularProgressIndicator(),): ElevatedButton(onPressed: ()  {
                    if (_pForm.currentState!.validate()){
                          postProduct(context);
                    }
                  }, child: const Text("Add")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

