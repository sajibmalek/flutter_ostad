import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

     return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: "Body Container",
       home: home(),
     );
  }

}

class home extends StatelessWidget{
  TextEditingController emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(onPressed: (){},icon: Icon(Icons.home),),
        title: Text("Huha"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              print("object");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notification_add,size: 20,),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          //
          SizedBox(height: 20,),
          Image.network("https://i.pinimg.com/736x/97/21/05/972105c5a775f38cf33d3924aea053f1.jpg",
            width: 200,height: 200,

          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: emailController,
            keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Number"),
              border: OutlineInputBorder(

              ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:  Colors.green,width: 1.5),
                ),
enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(color:  Colors.black,width: 1),
),

                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:  Colors.red,width: 1),
                ),

              ),
            ),
          ),
           TextButton(onPressed: (){
              TextEditingController text= emailController;

             print(text);
    }, child: Text("Show",style: TextStyle(
             backgroundColor: Colors.green,
             color: Colors.white,

           ),)),

        ],
      ),
    );
  }
  
}