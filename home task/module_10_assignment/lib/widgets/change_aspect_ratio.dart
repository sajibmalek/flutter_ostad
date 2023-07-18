
import 'package:flutter/material.dart';
import 'package:module_10_assignment/widgets/portrait_page.dart';

import 'landscape _page.dart';





class ChangeAspectRatio extends StatelessWidget {
   ChangeAspectRatio({super.key});
//bool _isPortrait=false;
  final ScrollController appBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
     var _isPortrait= MediaQuery.of(context).orientation==Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: _isPortrait?PortraitPage(appBarController: appBarController,):LandscapePage(appBarController: appBarController,),
    );
  }
}
