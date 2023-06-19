import 'package:flutter/material.dart';

void main(){

  runApp(app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sum App",
      debugShowCheckedModeBanner: false,
      home:   homePage(),
    );
  }


}

class homePage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeui();
  }
}
class homeui extends State<homePage>{
  Map<String, String> FormValue={
    "num1":"", "num2":""
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sum App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
              Text("Sum is= "),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                onChanged: (value){
                 FormValue.update("num1",(value)=> value );

                },
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                  ),

                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Container(

                color: Colors.green,
                width: double.infinity,
                height:   40,
                child: ElevatedButton(onPressed: (){},child: Text("Add",style: TextStyle(

                  color: Colors.white,
                ),),),
              ),
            )
          ],
        ),
      ),
    );
  }

}