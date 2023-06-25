import 'package:flutter/material.dart';
import 'package:todo/todo.dart';




void main(){
  runApp(app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: "Todo",
        theme: ThemeData(primarySwatch: Colors.green),
      themeMode: ThemeMode.system,
      home:todo(),
    );
  }
}
