import 'package:get/get.dart';

class count_controller extends GetxController{
  var count=0.obs;
  void increment(){
    count++;
  }
}