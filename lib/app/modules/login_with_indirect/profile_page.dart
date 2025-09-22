import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile_screen extends StatefulWidget {
   profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {

  Future<void> logout() async{
    SharedPreferences pref = await SharedPreferences.getInstance();

     await pref.remove('loginin');
     Get.offAllNamed(AppRoutes.login);
  }
  @override
  Widget build(BuildContext context) {
    // Map<String,dynamic> data = Get.arguments;
    // final data1= Get.parameters['id'];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListTile(
          title: Text("profile_screen screen ",style: TextStyle(fontSize: 25),),
          subtitle: ElevatedButton(onPressed: (){
            logout();
          }, child: Text('go to login page')),
        ),
      ),
    );
  }
}
