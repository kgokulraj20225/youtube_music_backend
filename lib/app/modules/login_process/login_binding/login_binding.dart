import 'package:get/get.dart';

import '../login_controller/login_controller.dart';

class login_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(login_controller());
  }
}