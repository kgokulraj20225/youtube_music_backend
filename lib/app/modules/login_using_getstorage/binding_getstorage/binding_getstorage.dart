// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../controller_getstorage/controller_getstore.dart';
//
// class loginsys_getstorage extends Bindings{
//   @override
//   void dependencies() {
//     Get.put(checkloginlogout());
//   }
// }

import 'package:get/get.dart';

import '../controller_getstorage/controller_getstore.dart';
// import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print("✅ HomeBinding → Injecting HomeController");
    Get.lazyPut(() => HomeController());
  }
}
