
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

class Todo{
  String title;
  String decription;
  bool isDone;

  Todo(this.title,this.decription, this.isDone );
}

class _todoState extends State<todo> {

TextEditingController _titleController=TextEditingController();
TextEditingController _decController=TextEditingController();

  List<Todo> todos=[];

  GlobalKey<FormState> todoForm= GlobalKey<FormState>();

  void addNewModal(String topTitle){
        showModalBottomSheet(context: context, builder: (context){

          return Padding(
            padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.green,
               // color: Color.fromRGBO(33, 191, 115, 1),
                elevation: 8,
                child: Form(
                  key: todoForm,
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(topTitle,style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          validator: (String ?value){
                             if(value?.trim().isEmpty??true){
                               return "Enter your title";
                             }
                             print(value);
                            return null;
                          },
        //  obscureText: true,
          decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Title',
          //  helperText: "exmaple@gmail.com"
            hintText: "exmaple@gmail.com",
          ),
             controller: _titleController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                       //   obscureText: true,
                          validator: (String ?value){
                            if(value?.trim().isEmpty??true){
                              return "Enter your Description";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                          controller: _decController,
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                       child:  Container(
                         height: 40,
                         width: double.infinity,
                         child: ElevatedButton(onPressed: (){

                           if(todoForm.currentState!.validate()) {
                             todos.add(Todo(_titleController.text.trim(), _decController.text.trim(), false));
                             if (mounted) {
                               setState(() {});
                             }
                             _titleController.clear();
                             _decController.clear();
                            Navigator.pop(context);
                           }
                           }, child: Icon(Icons.add)),
                       ),
                     ),
                    ],
                  ),
                ),
            ),
          );
        });
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.warning_amber,color: Colors.red,),),
                      Text('Warning'),
                    ],
                  ) ,
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Do you want to delete all elements from list'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Would you like to approve of this message?'),
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
                      child: const Text('OK'),
                      onPressed: () {
                        todos.clear();
                        if(mounted){
                          setState(() {
                          });
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );

          }, icon: Icon(Icons.delete,color: Colors.white,))
        ],
        title: Text("To Do"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context,index){
          return Expanded(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: Color.fromRGBO(33, 191, 115, 1),
              //color: Color.fromRGBO(33, 191, 115, 1),
              elevation: 8,
              child: Expanded(
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: ListTile(
                    onLongPress: (){
                       todos[index].isDone=true;

                      if(mounted){
                        setState(() {
                        });
                      }
                    },
                    //onTap: (){},
                    leading: Visibility(
                      visible:todos[index].isDone ,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                         child: Icon(Icons.done,color: Colors.green,size: 25,),
                      ),
                      replacement: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        child: Icon(Icons.pending_outlined,color: Colors.deepOrange,),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(todos[index].title,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    subtitle:Text(todos[index].decription,style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 17
                    ),) ,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                            child: IconButton(onPressed: (){
                              addNewModal("Edit your task");
                            },icon: Icon (Icons.edit_note,color: Colors.green,),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                                child: IconButton(onPressed: (){
                                  todos.removeAt(index);
                                  if(mounted){
                                    setState(() {
                                    });
                                  }
                                },icon: Icon(Icons.delete_forever,color: Colors.red,),)
                          ),
                        ]),
                  )
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton:  FloatingActionButton(
          onPressed: (){
            if(mounted){
              addNewModal("Add new Task");
             // todos.add(Todo("title1", "decription", false));
              setState(() {
              });
            }
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
