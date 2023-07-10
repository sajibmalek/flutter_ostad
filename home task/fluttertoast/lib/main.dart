import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(toast());
}
class toast extends StatelessWidget {
  const toast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toast Message",
      home: Toast(),
    );
  }
}
class Toast extends StatelessWidget {
  const Toast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast Message"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }, child:Text("Get Message")),
      ),
    );
  }
}
