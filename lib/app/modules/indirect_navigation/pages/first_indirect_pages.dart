import 'package:demo_flutter_project/app/modules/indirect_navigation/indirect_controller/indirect_controller.dart';
import 'package:demo_flutter_project/app/modules/indirect_navigation/pages/second_indirect_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class indirect_nav_first_page extends StatelessWidget {
  const indirect_nav_first_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: nextpages(),
    );
  }
}
class nextpages extends StatelessWidget {
  final indirect_controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Obx(()=>Text('${controller.name}')),
        ),
        TextButton.icon(onPressed: (){
          Get.toNamed('/second');
        },icon: Icon(Icons.next_plan),label: Text("second page"),)
      ],
    );
  }
}

