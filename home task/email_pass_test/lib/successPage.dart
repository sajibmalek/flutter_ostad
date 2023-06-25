import 'package:flutter/material.dart';

class seccessPage extends StatefulWidget {
  const seccessPage({super.key});

  @override
  State<seccessPage> createState() => _seccessPageState();
}

class _seccessPageState extends State<seccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Success Page") ,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.login)),
          )
        ],
      ),
    );
  }
}
