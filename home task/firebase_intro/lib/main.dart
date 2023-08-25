import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future<void> liveScore()async{
      CollectionReference collectionReference=firebaseFirestore.collection('live_score');
      DocumentReference documentReference=collectionReference.doc('1_Ban_Vs_Ind');

      final data =await documentReference.get();
  print(data.data());
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("FireBase Intro"),),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
     //   mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text("Match Name",style: Theme.of(context).textTheme.headlineMedium,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              Column(
                children: [
                  Text("Score",style: Theme.of(context).textTheme.titleLarge,),
                  Text("Team Name",style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
              SizedBox(width: 2,),
              Text("Vs"),
              SizedBox(width: 2),
              Column(
                children: [
                  Text("Score",style: Theme.of(context).textTheme.titleLarge,),
                  Text("Team Name",style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}