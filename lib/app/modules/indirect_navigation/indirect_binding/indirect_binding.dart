import 'package:demo_flutter_project/app/modules/indirect_navigation/indirect_controller/indirect_controller.dart';
import 'package:get/get.dart';

class indirect_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(indirect_controller());
  }
}