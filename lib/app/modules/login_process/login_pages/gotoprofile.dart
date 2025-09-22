import 'package:demo_flutter_project/app/modules/login_process/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class gotopro extends StatelessWidget {
  const gotopro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: profile(),
    );
  }
}
class profile extends StatelessWidget {
  // const profile({super.key});
 final login_controller controller = Get.find<login_controller>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            // height: 100,
            // width: 100,
            child: Text('this is the profile page'),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(()=>Column(
            children: [
              Text('${controller.name}'),
              Text('${controller.password}')
            ],
          ))
        ],
      ),
    );
  }
}

