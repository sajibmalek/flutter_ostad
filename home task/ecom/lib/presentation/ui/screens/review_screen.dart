import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Review"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    // what is the difference between labelText and label?
                    //label: Text("Email"),
                      labelText: "First Name",
                      hintText: "Sajib",
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    // what is the difference between labelText and label?
                    //label: Text("Email"),
                      labelText: "Last Name",
                      hintText: "A.Malek",
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    // what is the difference between labelText and label?
                    //label: Text("Email"),
                      contentPadding: EdgeInsets.symmetric(vertical: 50),
                      labelText: "Write Review",
                     // hintText: "Sopura,miya-para 6203,word no:15, Rajshahi",
                      prefixIcon: Icon(
                        Icons.reviews_rounded,
                      )),
                ),

                const SizedBox(
                  height: 16,
                  width: 50,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Submit"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
