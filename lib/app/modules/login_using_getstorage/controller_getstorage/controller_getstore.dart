// import 'package:demo_flutter_project/app/routes/app_route.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class checkloginlogout extends GetxController{
//   bool login=false;
//   final box= GetStorage();
//   var message= 'you are in the home page dont worry you are authroized user now'.obs;
//
//   void checklogin(){
//     print('the login is created');
//     box.write('login', true);
//     Get.offAllNamed(AppRoutes.home_page_using_get);
//   }
//
//   void logout(){
//     print('the logout is created');
//     box.remove('login');
//     Get.offAllNamed(AppRoutes.login_using_get);
//   }
//
// }

import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController() {
    print("🏠 HomeController created");
  }
}
