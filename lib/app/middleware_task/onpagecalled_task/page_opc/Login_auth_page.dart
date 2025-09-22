import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller_opc/controller_opc.dart';
class Login_auth_user_page extends StatefulWidget {
  const Login_auth_user_page({super.key});

  @override
  State<Login_auth_user_page> createState() => _Login_auth_user_pageState();
}

class _Login_auth_user_pageState extends State<Login_auth_user_page> {
  final Check_auth_user controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login page'),
      ),
      body: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            color: Colors.red,
            height: 20,
            width: 200,
            child: Text('Gokulraj'),
          ),Container(
            color: Colors.red,
            height: 20,
            width: 200,
            child: Text('Gokulraj'),
          ),
          ElevatedButton(onPressed: (){
            controller.login_auth();
          }, child: Text('login')),
          ElevatedButton(onPressed: (){
            Get.offAllNamed(AppRoutes.home_page_using_get);
          }, child: Text('login with login '))
        ],
      ),
    );
  }
}
