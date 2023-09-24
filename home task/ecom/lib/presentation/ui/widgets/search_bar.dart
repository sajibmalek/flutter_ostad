import 'package:flutter/material.dart';

class SearchBarTextF extends StatelessWidget {
  const SearchBarTextF({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: Icon(Icons.search,),
          hintText: "Search",
          border: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder( borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(
               borderSide: BorderSide.none
          )
      ),
    );
  }
}