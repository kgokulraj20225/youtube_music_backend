import 'package:demo_flutter_project/app/modules/direct_navigation/binding/direct_binding.dart';
import 'package:demo_flutter_project/app/modules/direct_navigation/controller/direct_controller.dart';
import 'package:demo_flutter_project/app/modules/direct_navigation/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class second_page extends StatelessWidget {
  final count_controller controller = Get.find<count_controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
            child: Obx(() => Text('${controller.count}'),),
          ),
          
          ElevatedButton(onPressed: (){
            controller.increment();
          }, child: Text("increment")),
          ElevatedButton(onPressed: (){
            Get.to(third_page(),binding: direct_binding());
          }, child: Text("third page"))
        ],
      ),
    );
  }
}
