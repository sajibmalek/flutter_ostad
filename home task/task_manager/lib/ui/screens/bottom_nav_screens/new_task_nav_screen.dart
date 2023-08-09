import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_manager/ui/data/models/network_response.dart';
import 'package:task_manager/ui/data/models/task_count_model.dart';
import 'package:task_manager/ui/data/models/task_list_model.dart';
import 'package:task_manager/ui/data/services/ApiUrl.dart';
import 'package:task_manager/ui/data/services/network_caller.dart';
import '../../../widgets/summary_card.dart';
import '../../../widgets/user_profile_banner.dart';
import '../../../widgets/user_task_list.dart';
import '../add_new_task.dart';

class NewTaskNavScreen extends StatefulWidget {
  const NewTaskNavScreen({super.key});

  @override
  State<NewTaskNavScreen> createState() => _NewTaskNavScreenState();
}


class _NewTaskNavScreenState extends State<NewTaskNavScreen> {
@override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //  getTaskCount();
   // getTaskList();
  });
    super.initState();

  }
  bool isTaskCountProgress=false;

    TaskCountModel _taskCountModel= TaskCountModel();
    TaskListModel _taskListModel=TaskListModel();

  Future<void> getTaskCount() async{
    isTaskCountProgress=true;
    if(mounted){
      setState(() {
      });
    }

  NetworkResponse response=await NetWorkCaller().getRequest(ApiUrl.taskStatusCount);
    if(response.isSuccess){
    isTaskCountProgress=false;
    if(mounted){
      setState(() {
      });
    }
_taskCountModel=TaskCountModel.fromJson(response.body!);

    if(mounted){
    //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("success")));
    }

  } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("failed")));
      }
    }
    isTaskCountProgress=false;
    if(mounted){
      setState(() {
      });
    }
  }

  Future<void> getTaskList() async{
    isTaskCountProgress=true;
    if(mounted){
      setState(() {
      });
    }

    NetworkResponse response=await NetWorkCaller().getRequest(ApiUrl.newTask);
    if(response.isSuccess){
      isTaskCountProgress=false;
      if(mounted){
        setState(() {
        });
      }
      _taskListModel=TaskListModel.fromJson(response.body!);

      if(mounted){
        //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("success")));
      }

    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("failed")));
      }
    }
    isTaskCountProgress=false;
    if(mounted){
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                const userProfileBanner(),
                //  Padding(
                //    padding: const EdgeInsets.symmetric(vertical: 5.0),
                //    child: isTaskCountProgress? const Center(child: LinearProgressIndicator()) :const Row(
                //      crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children:[
                //       Expanded(child: SummaryCard(number: 124,title: "new",)),
                //       Expanded(child: SummaryCard(number: 124,title: "In Progress",)),
                //       Expanded(child: SummaryCard(number: 124,title: "Cancelled",)),
                //       Expanded(child: SummaryCard(number: 124,title: "Completed",)),
                //
                //
                //     ],
                // ),
                //  ),

                // ListView.separated(
                //       itemBuilder: (context, index) {
                //         return UserTaskList(
                //           data: _taskListModel.data![index],
                //         );
                //       },
                //       separatorBuilder: (BuildContext context, int index) {
                //         return const Divider();
                //       },
                //       itemCount: 10)
            ],
            ),
          ),

      ) ,
     floatingActionButton: FloatingActionButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTask()));
     },child: const Icon(Icons.add),),
    );
  }
}





