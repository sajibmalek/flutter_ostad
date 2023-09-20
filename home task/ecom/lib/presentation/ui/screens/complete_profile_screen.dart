import 'package:ecom/presentation/ui/utility/strings_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utility/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child:
                        SvgPicture.asset(ImageAssets.CraftyBayLogo, width: 100)),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  StringsAssets.compelteProfile,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(StringsAssets.compelteProfileSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      // what is the difference between labelText and label?
                      //label: Text("Email"),
                      labelText: "First Name",
                      hintText: "Sajib",
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      // what is the difference between labelText and label?
                      //label: Text("Email"),
                      labelText: "Last Name",
                      hintText: "A.Malek",
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      // what is the difference between labelText and label?
                      //label: Text("Email"),
                      labelText: "Mobile",
                      hintText: "0171234xxxx",
                      prefixIcon: Icon(
                        Icons.phone_android_rounded,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      // what is the difference between labelText and label?
                      //label: Text("Email"),
                      labelText: "City",
                      hintText: "Rajshahi",
                      prefixIcon: Icon(
                        Icons.location_city_rounded,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      // what is the difference between labelText and label?
                      //label: Text("Email"),
                      contentPadding: EdgeInsets.symmetric(vertical: 40),
                      labelText: "Address",
                      hintText: "Sopura,miya-para 6203,word no:15, Rajshahi",
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Complete"))),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
