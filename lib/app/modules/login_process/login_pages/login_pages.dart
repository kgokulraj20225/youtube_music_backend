import 'package:demo_flutter_project/app/modules/login_process/login_binding/login_binding.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_controller/login_controller.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login_pages extends StatelessWidget {
  const login_pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("the login page"),
      ),
      body: seconds_page(),
    );
  }
}

class seconds_page extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController password= TextEditingController();
  final login_controller controller = Get.find<login_controller>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      // direction: Axis.vertical,
      children: [
        Container(
          width: 1000,
          height: 10,
          color: Colors.red,
        ),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: 'name',

          ),
        ),TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: 'password',
          ),
        ),
        OutlinedButton(onPressed: (){
          controller.login(name.text,password.text);
          if(controller.loginn.value){
            Get.to(()=>home_page(),binding: login_binding());
          }
          else{
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text('error',style:TextStyle(color: Colors.red),),
              content: Text('the user and password is not correct pls check the again',style: TextStyle(color: Colors.red,fontSize: 13),),
              actions: [
                TextButton(onPressed: (){
                  Get.back();
                }, child: Text('ok'))
              ],
            ),);
          }
        }, child: Text('Login'))

      ],
    );
  }
}

