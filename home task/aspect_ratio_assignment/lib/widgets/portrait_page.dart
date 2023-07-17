import 'package:flutter/material.dart';

class PortraitPage extends StatelessWidget {
  PortraitPage({super.key});

  var Mylist = [
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/354455482_3415736658754773_3792430057975507669_n.jpg?_nc_cat=106&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeG-cUJQNM3fRiio7JecQ3WoMmiBo6q5SP0yaIGjqrlI_WCGGrXe52caZpQE0iSnHJdj6R_wIgVFacS9OXiSd7UO&_nc_ohc=NZOq0oWdUH8AX_pg1r-&_nc_ht=scontent.frjh1-1.fna&oh=00_AfDisqeIDq4o0FE4R8m-I4kJFSSGTfOyjeJFXqO7dQhukA&oe=64B91701",
      "title": "Sajib Malek"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/315967814_1580803045769880_8661009824836759040_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Z33mrO5PrTUAX-DJm04&_nc_ht=scontent.frjh1-1.fna&oh=00_AfAq8XckV3YySfvZFCwPbIlj8Hh5dhXhuQhvsSAlN_bm_w&oe=63BE0889",
      "title": "Jerry vai"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/323628260_835533040888520_6256628896409078004_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=DQRhN8AOjJoAX9WMaKj&_nc_ht=scontent.frjh1-1.fna&oh=00_AfCnmujm2mrkwgn_6t3_eQ6KWFUAb2zpVOfMUdRcCP8x7w&oe=63BE9769",
      "title": "Sunjita Bethy"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t1.6435-9/67802303_717369865392096_2086120123097153536_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=Wxwco-gjSNEAX_V8gal&tn=sfq9EmTs4dB3qBj0&_nc_ht=scontent.frjh1-1.fna&oh=00_AfC9J-VmiX6yfAkYvPBauuT7Rdm2ECR2luxLKZBL52z4Ng&oe=63E0D340",
      "title": "Rafiur Rahman"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/322384595_1003719287251477_5098260883400152192_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uHjxYD4OXh4AX-CqSvp&tn=sfq9EmTs4dB3qBj0&_nc_ht=scontent.frjh1-1.fna&oh=00_AfDkOynr3EEUmutrBoIAQGdXVc-G02WsXVhcOwLfRh5iFg&oe=63BDC17C",
      "title": "Kawchar"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/324234540_1242285892992375_4396364310093647084_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=bRZxCAxGv4YAX_S-qrg&_nc_ht=scontent.frjh1-1.fna&oh=00_AfDJsp-lTytipRBSQPeRRH5QYd4t7aMJHP1hDSexc9je6A&oe=63BEC179",
      "title": "Mitu"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t39.30808-6/314537644_3420577111499100_3795712034799680586_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Rl4ZcFpPCcEAX86OS1A&tn=sfq9EmTs4dB3qBj0&_nc_ht=scontent.frjh1-1.fna&oh=00_AfBb3TUENgNy7DorZcAaP9wF8WrXKzMeJQSohFIG7yF1Qg&oe=63BEA3A9",
      "title": "Rahi"
    },
    {
      "img":
          "https://scontent.frjh1-1.fna.fbcdn.net/v/t1.6435-9/131363633_835585603955325_3257150192056731887_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=1vDjwflelcsAX_IRNm3&_nc_ht=scontent.frjh1-1.fna&oh=00_AfCTof3XKSpC90_AY6IYjdZcWr1XkvCUcA8o6ew_iCBBvw&oe=63E0D88B",
      "title": "Masud"
    },
    // {"img":"", "title":"Basar"},
    // {"img":"", "title":"Fahad"},
    // {"img":"", "title":"Safwan"},
    // {"img":"", "title":"Jisa"}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                        child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: size.width / 4,
                      child: CircleAvatar(
                        radius: (size.height / 5) - 10,
                        backgroundImage: const NetworkImage(
                            "data:image/png;base64,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"),
                      ),
                    )),
                  ),
                ),

                //  const    SizedBox(height: 10,),


                Row(
                  children: [
                    Text("data",),
                    Text("data",),
                    Text("data",),
                  ],
                ),


              ],

              //
      ),


    );
  }
}
