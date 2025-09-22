import 'package:get/get.dart';



class auth extends GetxController{
  var loginin=false.obs;

  void login(String name,String password){
    if(name=='gokul' && password=='gokul'){
      loginin.value=true;
    }
  }
  void logout(){
    loginin.value=false;
  }
}
