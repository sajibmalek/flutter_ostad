import 'package:flutter/material.dart';
import 'package:welcome_screen/widgets/app_text.dart';
import 'package:welcome_screen/widgets/app_text_large.dart';
import 'package:welcome_screen/widgets/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images=[
    '2.png',
    '2.png',
    '2.png'
  ];


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context,index){
          return
           Container(
              margin: EdgeInsets.only(left: 50),
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "img/"+images[index]
                    ),
                    fit: BoxFit.cover
                )
              ),
             child: Container(
               margin: EdgeInsets.only(top: 50,left: 20,right: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        AppLargeText(text: "Trip"),
                       AppText(text: "Mountain",size: 30,),
                       SizedBox(height: 10,),
                       Container(
                         width: 230,
                         child: AppText(
                           text: "Mountain hikes give you an incredible scenes of freedom along with endurance test",
                           size: 14,
                         ),
                       ),
                       SizedBox(height: 30,),
                       ResponsiveButton(width: 120,),
                     ],
                   ),
                   Column(
                     children: List.generate(3, (indexDots) {
                       return Container(
                         margin: EdgeInsets.only(bottom: 3),
                        width: 8,
                         height:index ==indexDots? 25:8,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: index ==indexDots ?Colors.indigo:Colors.indigo.withOpacity(0.3)
                         ),
                       );
                     } ),
                   )
                 ],
               ),
             ),
           );
      }),

    );
  }
}
