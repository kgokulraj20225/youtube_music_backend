import 'package:demo_flutter_project/app/modules/indirect_navigation/indirect_controller/indirect_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class indirect_nav_third_page extends StatelessWidget {
  final indirect_controller controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
        title: Obx(()=>Text("${controller.name}")),
        subtitle: ElevatedButton(onPressed: (){
          Get.offAllNamed('/first_page');
        }, child: Text('go back')),
      ),
    );
  }
}
