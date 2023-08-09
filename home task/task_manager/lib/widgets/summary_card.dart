import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final int number;
  final String title;
  const SummaryCard({
    super.key, required this.number, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            elevation: 3,
            child: Column(
              children: [
              Text('$number',style: const TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold
                  ),),
                Text(title,style: const TextStyle(
                      fontSize: 16,
                  ),)
              ],
            ),
          ),
        ),
      );
  }
}