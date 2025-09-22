import 'package:get/get.dart';

import '../controller/direct_controller.dart';

class direct_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(count_controller());
  }
}