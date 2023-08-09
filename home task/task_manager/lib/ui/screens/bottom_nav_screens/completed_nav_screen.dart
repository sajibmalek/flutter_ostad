import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedNavScreen extends StatelessWidget {
  const CompletedNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: const Text("Title"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sub-title"),
                  const Text("Date"),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Chip(
                          label: Text(
                            "Complete",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.edit_note, color: Colors.green),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
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
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 5,
            );
          },
        ));
  }
}
