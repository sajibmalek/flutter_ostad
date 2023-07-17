import 'package:flutter/material.dart';

void main(){
  runApp(responsive());
}

class responsive extends StatefulWidget {
  const responsive({super.key});

  @override
  State<responsive> createState() => _responsiveState();
}

class _responsiveState extends State<responsive> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      title: "Responsive class 1",
    );
  }
}


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    print(size);
    return  Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print(constraints.maxHeight);
          return   Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 20,
                      child: FittedBox(
                          child: Text("s simply dummy text of the printing and typesetting industry. Lorem Ipsum................")),
                    )   ,
                    SizedBox(width: 10,),

                    Text("s simply dummy text of the printing and typesetting industry. Lorem Ipsum"),

                  ],
                ),
SizedBox(height: 90,),
      if(constraints.maxWidth>1200)
        Text("Desktop",),
                if(constraints.maxWidth>700 && constraints.maxWidth <1200)
                  Text("Tablet"),
                if(constraints.maxWidth<=300)
                  Text("Mobile"),


                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 300,
                  color: Colors.indigo,
                  child: AspectRatio(
                    aspectRatio: 16/10,
                    child: Container(

                      color: Colors.green,

                    ),
                  ),
                )

              ],
          ),);
        },

      ),
    );
  }
}

