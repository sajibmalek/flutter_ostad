import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key, required this.icon, required this.onTap,
  });
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      borderRadius: BorderRadius.circular(25),
      child: CircleAvatar(
        child: Icon(icon,size: 16,),
        backgroundColor: Colors.grey.shade300,
        radius: 14,
      ),
    );
  }
}