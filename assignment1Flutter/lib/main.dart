import 'dart:html';

import 'package:assignment1withflutter/Pages/page1.dart';
import 'package:assignment1withflutter/Pages/page2.dart';
import 'package:assignment1withflutter/Pages/page3.dart';
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
    return DefaultTabController(
      length: 4,


      child: Scaffold(
        appBar: AppBar(title: Text("My App"),
bottom:  TabBar(
//isScrollable: true,

  tabs: [
    Tab(icon: Icon(Icons.home),text: 'Page 1',),
    Tab(icon: Icon(Icons.home),text: 'Page 2',),
    Tab(icon: Icon(Icons.home),text: 'Page 3',)
  ],
),
        ),



        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap:(int index) {
            if(index ==0){
              //snackMessage("Page 1 ",context,Colors.green);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>page1()));
            }
   if(index==1){
       //snackMessage("Page 2 ",context,Colors.orangeAccent);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));
            }
            if(index==2){
            //  snackMessage("Page 3 ",context,Colors.purple);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>page3()));
            }
            
          },
          items: [
           BottomNavigationBarItem(icon: Icon(Icons.add),label: "Page 1"),
            BottomNavigationBarItem(icon: Icon(Icons.add),label: "page 2"),
            BottomNavigationBarItem(icon: Icon(Icons.add),label: "Page 3"),
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
                title: Text("Page 1"),
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>page1()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Page 2"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Page 3"),
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>page3()));
                },
              ),
            ],
          ),
        ),
    body: TabBarView(
      children: [
        page1(),
        page2(),
        page3()
      ],
    ),
        ),
      );
  }

}

