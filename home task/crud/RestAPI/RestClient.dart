
 import 'dart:convert';

import 'package:crud/Style/Style.dart';
import 'package:http/http.dart';


import 'ModelClass/ProductList.dart';

void getProducts()async{

  const String url="https://crud.teamrabbil.com/api/v1/ReadProduct";
  Response response =await get(Uri.parse(url));
  var resCode= response.statusCode;
  var resBody=jsonDecode(response.body);

  if(resCode==200&& resBody['status']=='success'){
    SuccessToast("Request Success");
    return resBody['data'];
  }

  else{
    ErrorToast("Request fail! try Again");
  }

 }