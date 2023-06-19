import 'package:flutter/material.dart';

class cart_screen extends StatefulWidget {
    cart_screen({super.key});


  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  int cart=1;
  int price=200;
  late int res= price*cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),

        actions: [
          GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [

            Card(
          elevation: 4,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.lightGreen
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox(

                width: 150,
                height: 150,
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/220px-Pizza-3007395.jpg",
                  width: 130,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
        ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Neapolitan Pizza",style: TextStyle(
                fontSize: 24,color: Colors.amber,
                fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Neapolitan pizza, or pizza Napoletana, is a type of pizza that originated in Naples, Italy. This style of pizza is prepared with simple and fresh ingredients: a basic dough, raw tomatoes, fresh mozzarella cheese, fresh basil, and olive oil. No fancy toppings are allowed!",style: TextStyle(
                  fontSize: 14,color: Colors.black,
                  fontWeight: FontWeight.w200
              ),),
            ),
            Text("Price: 200tk"),
            Text("Total Price: $res"),


              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 100,vertical: 20),

                  child: Center(
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){

                          if(cart==10){
                            cart==10;
                          }
                          else{
                            cart +=1;
                            res =price*cart;
                          }

                          setState(() {

                          });
                        }, child: Icon(Icons.add,color: Colors.white,),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$cart",style: TextStyle(
                          ),),
                        ),

                        ElevatedButton(onPressed: (){
                          if(cart<=1){
                            cart==1;
                          }
                          else{
                            cart -=1;
                            res =price*cart;
                          }

                          setState(() {

                          });
                        }, child: Center(
                          child: Text("-",style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),),
                        )),
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
