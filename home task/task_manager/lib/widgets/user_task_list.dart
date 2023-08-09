import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/data/models/task_list_model.dart';

class UserTaskList extends StatelessWidget {
  const UserTaskList({
    super.key, required this.data,
  });
final TaskData data;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {

            ListTile(
              title:   Padding(
                padding: EdgeInsets.all(4.0),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(data.title??"Unknown"),
                ),
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(data.description??""),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(data.createdDate??""),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Chip(
                          label: Text(
                           data.status??"New",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.edit_note, color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.red.shade400,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
            return null;
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 5,
          );
        },
      );

  }
}
