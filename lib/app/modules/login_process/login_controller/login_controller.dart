import 'package:get/get.dart';

import '../login_pages/home_page.dart';

class login_controller extends GetxController{
  var name=''.obs;
  var password=''.obs;
  var loginn=false.obs;

  void login(String inputname,String inputpassword){
    name.value=inputname;
    password.value=inputpassword;
    if(name.value=='gokul' && password.value=='gokul'){
      // Get.to(()=>home_page());
       loginn.value=true;
    }
    else {
      loginn.value=false;
    }
    }
  }
