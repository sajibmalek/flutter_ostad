import 'package:flutter/material.dart';

import 'Portrait_Page.dart';
import 'landscape_page.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    var _isPortrait= MediaQuery.of(context).orientation==Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text("News feed"),

      ),
      body: _isPortrait?PortraitPage():LandscapePage(),
    );
  }
}
