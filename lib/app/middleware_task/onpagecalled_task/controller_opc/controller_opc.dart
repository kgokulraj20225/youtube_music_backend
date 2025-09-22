import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Check_auth_user extends GetxController{
  final storage = GetStorage();
  var name = 'gokulraj'.obs;
  void login_auth(){
    storage.write('login_auth', true);
    Get.offNamed(AppRoutes.home_page_using_get);
  }
  void claim_premiumd() {
    final box=GetStorage();
    box.write('premium', true);
  }
  void logout_auth(){
    storage.remove('login_auth');
    Get.offAllNamed(AppRoutes.login_using_get);
  }
  void cancel_premium(){
    storage.remove('premium');
    Get.offAllNamed(AppRoutes.home_page_using_get);
  }
}

class check_only_auth_user extends GetMiddleware{
  final storage = GetStorage();
  var name = 'gokulraj'.obs;
  void logout_auth(){
    print('the use to trigger the onbindingsend');
    storage.remove('login_auth');
    Get.offAllNamed(AppRoutes.login_using_get);
  }
}