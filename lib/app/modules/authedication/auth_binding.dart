import 'package:demo_flutter_project/app/modules/authedication/auth_controller.dart';
import 'package:get/get.dart';


class setup_bind extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<auth>(()=>auth());
  }

}


