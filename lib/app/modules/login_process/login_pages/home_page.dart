import 'package:demo_flutter_project/app/modules/direct_navigation/pages/third_page.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_binding/login_binding.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gotoprofile.dart';

class home_page extends StatelessWidget {
  final login_controller controller = Get.find<login_controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
              child: Obx(() => Text("Welcome ${controller.name}")),
            ),
            TextButton.icon(
              onPressed: () {
                Get.to(() => gotopro(),
                    binding: login_binding(), transition: Transition.downToUp);
              },
              icon: Icon(Icons.people),
              label: Text('go to profile'),
            )
          ],
        ),
      ),
    );
  }
}
