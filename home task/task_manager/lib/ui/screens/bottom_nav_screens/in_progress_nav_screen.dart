import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/data/models/network_response.dart';
import 'package:task_manager/ui/data/models/task_list_model.dart';
import 'package:task_manager/ui/data/services/ApiUrl.dart';
import 'package:task_manager/ui/data/services/network_caller.dart';

class InProgressNavScreen extends StatefulWidget {
  const InProgressNavScreen({super.key});

  @override
  State<InProgressNavScreen> createState() => _InProgressNavScreenState();
  
}

class _InProgressNavScreenState extends State<InProgressNavScreen> {
  @override
  void initState() {
    super.initState();
      getInprogressTask();
  }
  bool _isTaskInprogress=false;
  TaskData data=TaskData();
  final TaskListModel _taskListModel=TaskListModel();

  Future<void> getInprogressTask() async{
    NetworkResponse response=await NetWorkCaller().getRequest(ApiUrl.inProgress);
    if(response.isSuccess){
      _isTaskInprogress=true;
      if(mounted){
        setState(() {
        });
      }
    }
    else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed")));
      }
    }
    _isTaskInprogress=false;
    if(mounted){
      setState(() {
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _isTaskInprogress? const Center(child: CircularProgressIndicator(),):ListView.separated(
          itemCount: _taskListModel.data?.length??3,
          itemBuilder: (context, index) {
            return ListTile(
              title:   Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(data.title.toString()),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding:const EdgeInsets.all(4.0),
                    child: Text(data.description.toString()),
                  ),
                   Padding(
                    padding:const EdgeInsets.all(4.0),
                    child: Text(data.createdDate.toString()),
                  ),
                  Row(
                    children: [
                       Padding(
                        padding:const EdgeInsets.all(4.0),
                        child: Chip(
                          label: Text(
                            data.status.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.purple,
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.edit_note, color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: (){},icon: Icon(Icons.delete_forever,color: Colors.red.shade400,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 5,
            );
          },
        ));
  }
}
