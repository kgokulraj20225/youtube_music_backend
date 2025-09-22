import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListTile(
          title: Text("splash screen",style: TextStyle(fontSize: 25),),
          subtitle: ElevatedButton(onPressed: (){
            Get.offNamed(AppRoutes.login);
          }, child: Text('go to login page')),
          trailing: ElevatedButton(onPressed: (){
            Get.toNamed(AppRoutes.home);
          }, child: Text("go to home page")),
        )
      ),
    );
  }
}
