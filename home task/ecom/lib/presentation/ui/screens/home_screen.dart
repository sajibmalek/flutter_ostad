import 'package:ecom/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.CraftyBayNavLogo),
            const Spacer(),
            CircularIconButton(
              onTap: () {},
              icon: Icons.person,
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              onTap: () {},
              icon: Icons.call,
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              onTap: () {},
              icon: Icons.notifications_none,
            ),
            const SizedBox(
              width: 8,
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration:InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder( borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 16,),
              const HomeSlider()
            ],
          ),
        ),
      ),
    );
  }
}

