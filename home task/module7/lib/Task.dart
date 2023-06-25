import 'dart:js';

import 'package:flutter/material.dart';

class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

class taskM{
  String title,decription,time_req;
  //bool isDone;
  taskM(this.title,this.decription,this.time_req);
}


class _taskState extends State<task> {
  List<taskM> tasklist=[];
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _desController=TextEditingController();
  final TextEditingController _timeReq=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  snackMessage(message,context,c){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message),
          backgroundColor:  c,
          //  textColor: Colors.red,
        )
    );
  }

  inputDialog(context){
    showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:   Text('Add Task'),
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _titleController,
                    validator: (String ?value){
                      if(value?.trim().isEmpty??true){
                        return "Enter your title";
                      }
                      return null;
                    },
                    //  obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      //  helperText: "exmaple@gmail.com"
                      hintText: "Enter your title",
                    ),

                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: _desController,
                        validator: (String ?value){
                          if(value?.trim().isEmpty??true){
                            return "Enter your description";
                          }

                          return null;
                        },
                        //  obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 5),
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                          //  helperText: "exmaple@gmail.com"
                          hintText: "Enter your description",
                        ),

                      ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _timeReq,
                    validator: (String ?value){
                      if(value?.trim().isEmpty??true){
                        return "Enter your Days";
                      }
                      return null;
                    },
                    //  obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Dayes Required',
                      //  helperText: "exmaple@gmail.com"
                      hintText: "Enter your Required Days",
                    ),

                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  tasklist.add(taskM(_titleController.text.trim(), _desController.text.trim(), _timeReq.text.trim()));



                if(mounted){
                  setState(() {
                  });
                }

                  _titleController.clear();
                  _desController.clear();
                  _timeReq.clear();

                Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
  void deleteModal(context,index){
    showModalBottomSheet(context: context,
        builder: (context){

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          height: 200,
          child:Stack(
            children: [
           Text("title ${tasklist[index].title}"),
              Text("title ${tasklist[index].decription}"),
              Text("title ${tasklist[index].time_req}"),
            ],
          ) ,
        )
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Task Management"),
        ),
      body: ListView.builder(
         itemCount:tasklist.length,
          itemBuilder: (context,index){
            return Expanded(child:
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: Color.fromRGBO(33, 191, 115, 1),
              //color: Color.fromRGBO(33, 191, 115, 1),
              elevation: 8,
              child: SizedBox(
                width: 200,
                height: 250,
                child: ListTile(
                  onLongPress: (){
                    deleteModal(context,index);
                  },
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: Text("Title: ${tasklist[index].title}"),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.title_rounded),
                          ),
                          Text("Decription: ${tasklist[index].decription}"),
                         // Text("decription")
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.timelapse),
                          ),
                          Text("Required Time: ${tasklist[index].time_req}"),
                        //  Text("Time")
                        ],
                      )
                    ],
                  ),
                ),
              )
            )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         // snackMessage("mess",context,Colors.green);
          inputDialog(context);

        },
        child: Icon(Icons.add),

      ),
    );
  }
}

