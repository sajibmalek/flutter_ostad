import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m7livetest/SecondScreen.dart';

void main(){

  runApp(app());
}

class counterData{

  String msg;
  counterData({required this.msg});
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Module 7 Live Test",
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return homePageUi();
  }

}

class homePageUi extends State<homePage>{

  int counter=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("CounterApp"),
     ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Counter Value",style: TextStyle(
                fontSize: 24
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(counter.toString(),style: TextStyle(
                fontSize: 20
            ),),
          ),
Center(
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(

      children: [

          Expanded(

            child: Container(

              color: Colors.green,

              child: TextButton(onPressed: (){

                setState(() {
                  counter++;
                  if(counter==5){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Counter Alert"),
                        content: Text('Counter value is 5!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                  else if(counter==10){

                    Navigator.push(context,MaterialPageRoute(builder: (c)=>const SecondScreen()));
                  }



                });
              },child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("+",style: TextStyle(
                    color: Colors.white,fontSize: 24
                ),),
              ),),

        ),
          ),

SizedBox(width: 20,),

         Expanded(

           child: Container(

              color: Colors.deepOrange,

              child: TextButton(onPressed: (){
              setState(() {
               /// counter--;
                if(counter<=0){
                  counter==0;
                }
                else{
                  counter--;
                }
              });
              },child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("-",style: TextStyle(
                  color: Colors.white,fontSize: 24
                ),),
              ),

            ),
            ),
         )

      ],

    ),
  ),
),

        ],
      ),
    ),
   );
  }

}
