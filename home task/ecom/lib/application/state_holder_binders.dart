
import 'package:get/get.dart';

import '../presentation/state_holders/main_bottom_nav_controller.dart';

class StateHolderBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }

}