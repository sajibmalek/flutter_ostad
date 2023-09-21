import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/colors_palatte.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.Icon_list,
    required this.list,
  });

  final IconData Icon_list;
  final String  list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(6)
            ),
            child: Icon(Icon_list,size: 40,),
          ),
            const SizedBox(height: 8,),
            Text(list,style: TextStyle(
              fontSize: 15,
              letterSpacing: 0.4,
              color: AppColors.primaryColor
            ),)
        ],
      ),
    );
  }
}