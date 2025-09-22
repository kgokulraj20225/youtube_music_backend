import 'package:get/get.dart';

import 'demo_controller.dart';

class demo_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(TodoController());
  }
}