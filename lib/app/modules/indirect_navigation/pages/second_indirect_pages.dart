import 'package:demo_flutter_project/app/modules/indirect_navigation/indirect_controller/indirect_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class indirect_nav_second_page extends StatelessWidget {
  final indirect_controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(

      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 20,
            width: 1000,
            color: Colors.red,
          ),
          Obx(()=>Text('${controller.name}')),
          ElevatedButton(onPressed: (){
            Get.offNamed('/third');
          }, child: Text('go third')),
          Container(
            height: 20,
            width: 1000,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
