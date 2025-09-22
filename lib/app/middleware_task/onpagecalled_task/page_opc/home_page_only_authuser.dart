import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller_opc/controller_opc.dart';

class home_auth_user_page extends StatefulWidget {
  const home_auth_user_page({super.key});

  @override
  State<home_auth_user_page> createState() => _home_auth_user_pageState();
}

class _home_auth_user_pageState extends State<home_auth_user_page> {
  final check_only_auth_user controller = Get.find<check_only_auth_user>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home page'),
        actions: [
          IconButton(onPressed: (){
            controller.logout_auth();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Obx(()=>Text('${controller.name}')),
          Text('this is the home page'),
          ElevatedButton(onPressed: (){
            Get.offNamed(AppRoutes.premium_page_auths);
          }, child: Text('premium'))
        ],
      ),
    );
  }
}
