import 'package:get/get.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utility/Api_urls.dart';
import 'get_task_controller.dart';

class DeleteTaskController extends GetxController {
  final GetTasksController _getTasksController = Get.find<GetTasksController>();

  Future<bool> deleteTask(String taskId) async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(ApiUrls.deleteTask(taskId));
    update();
    if (response.isSuccess) {
      _getTasksController.taskListModel.data!
          .removeWhere((element) => element.sId == taskId);
      update();
      return true;
    } else {
      return false;
    }
  }
}
