import 'package:demo_flutter_project/app/modules/direct_navigation/binding/direct_binding.dart';
import 'package:demo_flutter_project/app/modules/direct_navigation/controller/direct_controller.dart';
import 'package:demo_flutter_project/app/modules/direct_navigation/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class first_page extends StatelessWidget {
  // final count_controller controller = Get.find<count_controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Wrap(
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
          ),Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          ElevatedButton(onPressed: (){
            // controller.increment();
            Get.to(()=>second_page(),binding: direct_binding());
          }, child: Text("second page"))
        ],
      ),
    );
  }
}
