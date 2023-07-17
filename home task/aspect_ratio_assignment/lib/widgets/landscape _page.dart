import 'package:flutter/material.dart';

class LandscapePage extends StatelessWidget {
  const LandscapePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
     Container(
                margin: EdgeInsets.only(left: 15),
                width: size.width/4-10,
                height:size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: size.width / 5,
                        child: CircleAvatar(
                          radius: (size.width / 2) - 2,
                          backgroundImage: const NetworkImage(
                              "data:image/png;base64,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"),
                        ),
                      )),
                ),
              ),


               Container(
                 width: size.width,

                 child: GridView.builder(

                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                           //mainAxisExtent: 500,
                            crossAxisCount: 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            childAspectRatio:1

                          ),
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return  Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                width: 150,
                                height: 150,
                                child: Image.network(
                                  "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/347651888_257318480385967_2178794203850841612_n.jpg?_nc_cat=110&cb=99be929b-3346023f&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeEg8kHbCZYuNMN2baczqlpbo2gLZYgUsgqjaAtliBSyCkdNB7D0_aZ7O6G2hmKzaeYgxNJ5wrwxDn1MzeeAmtsw&_nc_ohc=wRUz7EAWZ3MAX8T3hpD&_nc_ht=scontent.frjh1-1.fna&oh=00_AfDeFt_2Kw8IaBYhEh4r8aNKoqTruZfiUOBZt-WHSz9scQ&oe=64B9B9EA",
                                  fit: BoxFit.fill,
                                  width: 10,
                                  height: 10,
                                ),
                            );
                          }),
               ),



        ],
      ),
    );
  }
}
