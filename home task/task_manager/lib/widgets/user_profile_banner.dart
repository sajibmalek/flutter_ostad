import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/auth_utility.dart';
import 'package:task_manager/ui/screens/auth/login_screen.dart';

class userProfileBanner extends StatefulWidget {
  const userProfileBanner({
    super.key,
  });

  @override
  State<userProfileBanner> createState() => _userProfileBannerState();
}

class _userProfileBannerState extends State<userProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.green,
      textColor: Colors.white,
      leading: CircleAvatar(
        backgroundImage: NetworkImage('${AuthUtility.userInfo.data!.photo}'),
        onBackgroundImageError: (_, __) => const Icon(Icons.image),
        radius: 15,
        backgroundColor: Colors.green,
      ),
      title: Text(
          "${AuthUtility.userInfo.data?.firstName}  ${AuthUtility.userInfo.data?.lastName}"),
      subtitle: Text("${AuthUtility.userInfo.data?.email}"),
      trailing: IconButton(
        onPressed: () async {
          await AuthUtility.logOutPref();
          if (mounted) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          }
        },
        icon: const Icon(Icons.login_outlined),
        color: Colors.white,
      ),
    );
  }
}
