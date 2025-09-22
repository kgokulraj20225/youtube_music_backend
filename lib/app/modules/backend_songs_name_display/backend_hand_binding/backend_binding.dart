import 'package:get/get.dart';

import '../backend_hand_controller/backend_hand_controller.dart';

class backend_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(song_controller());
  }
}