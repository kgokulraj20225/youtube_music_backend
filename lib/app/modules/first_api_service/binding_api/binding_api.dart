import 'package:get/get.dart';

import '../controller_api/controller_api.dart';

class api_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(BookingController());
  }
}