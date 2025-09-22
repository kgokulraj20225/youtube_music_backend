import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class setting_screen extends StatelessWidget {
  const setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListTile(
          title: Text("setting screen",style: TextStyle(fontSize: 25),),
          subtitle: ElevatedButton(onPressed: (){
            // Get.toNamed(AppRoutes.profile.replaceFirst(':id', '101'),arguments: {
            //   'name':'gokul',
            //   'age':23,
            //   'email':'kgokulraj@gmail.com'
            // });
            Get.toNamed(AppRoutes.profile);
          }, child: Text('go to profile page')),
          trailing: ElevatedButton(onPressed: (){
            Get.back(result: 'red');
          }, child: Text('go back')),
        ),
      ),
    );
  }
}
