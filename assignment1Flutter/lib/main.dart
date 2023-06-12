import 'dart:html';


import 'package:flutter/material.dart';



main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      debugShowCheckedModeBanner: false,
        home:HomeActivity());
  }

}

class HomeActivity extends StatelessWidget{
    HomeActivity({super.key});
  snackMessage(message,context,c){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message),
          backgroundColor:  c,
          //  textColor: Colors.red,

        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Live Test 1"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 10,

        actions: [
          Icon(Icons.home,),
          Icon(Icons.call),

        ],

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                accountName: Text("Md.Abdul Malek",style: TextStyle(color: Colors.black),),
                accountEmail: Text("a.malek0317@gmail.com",style: TextStyle(color: Colors.black)),
                //currentAccountPictureSize: ,
                currentAccountPicture: Image.network("https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/348307856_781678086925915_7698815693821733265_n.jpg?_nc_cat=102&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHK6HfcM7QUcmBR6xKHp7xlIqvSHLo1Bysiq9IcujUHK2GxGeP8QgQb63TPjTNyxtVUMHDBij6ZBVSoYWNtz6S0&_nc_ohc=dmpc-HIOy-wAX8lvmHR&_nc_ht=scontent.frjh1-1.fna&oh=00_AfC_6XE2NcNS01bU7USAyr-tCgF7DyuDeKaldRV5KNRV0w&oe=64827AFD"),
              ),

            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                snackMessage("Home",context,Colors.green);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("Call"),
              onTap: (){
                snackMessage("Call",context,Colors.cyan);
              },
            ),

          ],
        ),
      ),
body: Center(
  child: Column(
    children: [
      Image.network("https://media2.giphy.com/media/TFTTO4OWzdwhFBzSUz/giphy.gif?cid=6c09b952bw4g2jvdokzfukhc52hqhs2tc8nwafrd2xrfh09l&ep=v1_stickers_related&rid=giphy.gif&ct=s",width: 200,height: 200,
      fit: BoxFit.scaleDown,
      ),
      Text("Shinchan",style: TextStyle(fontSize: 25),),
      ElevatedButton(onPressed: (){  snackMessage("you have clicked the button",context,Colors.green);}, child: Text("Click now"),)
    ],
  ),

),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
      height: 100.0,
      width: 100.0,

      child: FittedBox(
        child: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.orange,
          child: TextButton(onPressed: (){},child: Text("FAB",style: TextStyle(color: Colors.white),),),

        ),
      ),
    ),
    );
  }

}

