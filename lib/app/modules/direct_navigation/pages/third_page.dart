import 'package:demo_flutter_project/app/modules/direct_navigation/controller/direct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class third_page extends StatelessWidget {
  final count_controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Obx(()=>Text('${controller.count}')),
          ),

        ],
      ),
    );
  }
}
