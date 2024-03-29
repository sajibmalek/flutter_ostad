import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/utility/string_utility.dart';
 import 'package:task_manager/ui/widgets/user_profile_appbar.dart';

import '../state_managers_controller/add_new_task_controller.dart';

class AddNewTaskScreen extends StatelessWidget {
  AddNewTaskScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleTEController = TextEditingController();

  final TextEditingController _descriptionTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserProfileAppBar(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        AppString.add_new_task,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _titleTEController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.title),
                          hintText: 'Title',
                          labelText: 'Title',
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return AppString.enter_title;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _descriptionTEController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.description_outlined),
                          hintText: 'Description',
                          labelText: 'Description',
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return AppString.enter_description;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GetBuilder<AddNewTaskController>(
                          builder: (addNewTaskController) {
                        return SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: addNewTaskController.adNewTaskInProgress ==
                                false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  addNewTaskController
                                      .addNewTask(
                                          _titleTEController.text.trim(),
                                          _descriptionTEController.text.trim())
                                      .then((value) {
                                    if (value) {
                                      _titleTEController.clear();
                                      _descriptionTEController.clear();
                                      Get.snackbar(
                                        'Success',
                                        'Task added successfully!',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                        borderRadius: 10,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Failed',
                                        'Task add failed!',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                        borderRadius: 10,
                                      );
                                    }
                                  });
                                },
                                child: const Icon(Icons.arrow_forward_ios)),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
