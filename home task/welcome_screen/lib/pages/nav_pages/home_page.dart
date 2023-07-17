import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcome_screen/widgets/app_text_large.dart';

class NavHomePage extends StatefulWidget {
   NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.menu_open,size: 20,color: Colors.indigo,),
                Expanded(child:Container()),
                  Container(
                    margin: EdgeInsets.only(right: 10,top: 15),
                    width: 30,
                    height: 30,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo
                    ),
                  )
                ],
              ),
            ),
          ),
          // SizedBox(height: 40,),
        /// discover text
          ExcludeSemantics(
            child: Container(
              height: 50,
                margin: EdgeInsets.only(left: 10),
                child: AppLargeText(text: "Discover")),
          ),

          //tab bar
          Expanded(
            child: Container(
              height: 300,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: Colors.indigo, radius: 4),
                  labelPadding: EdgeInsets.only(left: 20,right: 20),
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black12,
                  controller: tabController,
                  tabs: [
                    Tab(text: "Palecs",),
                    Tab(text: "Inspiration",),
                    Tab(text: "Emotions",),
                  ],
                ),
              ),
            ),
          ),
           SizedBox(height: 50,),
           Expanded(
             child: Container(
                margin: EdgeInsets.only(left: 20),
                child: TabBarView(
                  controller:tabController ,
                  children: [
                    ListView.builder(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemCount:3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(

                            margin: EdgeInsets.only(right: 20, top:12),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                              image: DecorationImage(
                                  image: AssetImage('img/tab_pic.png',
                              )),
                        ));
                      },
                    ),
                    Text("There"),
                    Text("Bye"),
                  ],

                ),
              ),
           ),

        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;

  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePinter(color:color,radius: radius);
  }
}
class CirclePinter extends BoxPainter{
  final Color color;
  double radius;
  CirclePinter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint=Paint();
    paint.color=color;
    paint.isAntiAlias=true;
    final Offset circleOffset= Offset(configuration.size!.width/2 -radius/2,configuration.size!.height-radius);
      canvas.drawCircle(offset+circleOffset,  radius, paint);
  }

}