import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/screens/auth/login_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
 import 'package:task_manager/ui/utility/auth_utility.dart';

import '../state_managers_controller/update_profile_controller.dart';

class UserProfileAppBar extends StatefulWidget {
  final bool? isUpdateScreen;

  const UserProfileAppBar({
    super.key,
    this.isUpdateScreen,
  });

  @override
  State<UserProfileAppBar> createState() => _UserProfileAppBarState();
}

class _UserProfileAppBarState extends State<UserProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if ((widget.isUpdateScreen ?? false) == false) {
            Get.to(() => const UpdateProfileScreen());
          }
        },
        child: GetBuilder<UpdateProfileController>(
            builder: (updateProfileController) {
          return Row(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: CachedNetworkImage(
                        placeholder: (_, __) =>
                            Image.asset('assets/images/person.png', width: 30),
                        imageUrl: AuthUtility.userInfo.data?.photo ?? '',
                        errorWidget: (_, __, ___) =>
                            Image.asset('assets/images/person.png', width: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    AuthUtility.userInfo.data?.email ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            if (mounted) {
              logoutAlertDialogue();
            }
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  void logoutAlertDialogue() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Logout Alert',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you want to log out?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              AuthUtility.clearUserInfo();
              Get.offAll(() => LoginScreen());
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
