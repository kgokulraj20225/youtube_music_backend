import 'package:get/get.dart';

import '../controller_opc/controller_opc.dart';

class binding_login_auth extends Bindings{
  @override
  void dependencies() {
    Get.put(Check_auth_user());
  }
}
class other_homebinding extends Bindings{
  @override
  void dependencies() {
    Get.put(check_only_auth_user());
  }
}