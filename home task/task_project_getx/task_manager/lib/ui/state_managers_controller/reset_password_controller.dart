import 'package:get/get.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utility/Api_urls.dart';

class ResetPasswordController extends GetxController {
  bool _setPasswordInProgress = false;

  bool get setPasswordInProgress => _setPasswordInProgress;

  Future<bool> resetPassword(String email, String otp, String password) async {
    _setPasswordInProgress = true;
    update();

    final Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password
    };

    final NetworkResponse response =
        await NetworkCaller().postRequest(ApiUrls.resetPassword, requestBody);
    _setPasswordInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
