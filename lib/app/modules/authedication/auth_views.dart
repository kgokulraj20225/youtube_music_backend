import 'package:demo_flutter_project/app/modules/authedication/auth_binding.dart';
import 'package:demo_flutter_project/app/modules/demo_list/demo_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../demo_list/demo_views.dart';
import 'auth_controller.dart';

class auth_views extends StatelessWidget {
  // final auth controller = Get.put(auth());
  final auth controller = Get.find<auth>();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'enter the name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'enter the password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Obx(() =>
                Text(controller.loginin.value ? 'login in' : 'invalid user')),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.login(name.text, password.text);
                      Get.to(()=>TodoPage(),binding: demo_binding());
                    } ,
                    child: Text("login")),
                ElevatedButton(
                    // onPressed: () => controller.logout(),
                  onPressed: ()=>Get.delete<auth>(),
                    child: Text('logout')),

              ],
            )
          ],
        ),
      ),
    );
  }
}


class secondscreen extends StatelessWidget {
  const secondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
