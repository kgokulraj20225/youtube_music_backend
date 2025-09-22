import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  Future<void> login() async{

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('loginin', true);
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListTile(
          title: Text(
            "login screen",
            style: TextStyle(fontSize: 25),
          ),
          subtitle: ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text('go to home page')),
          trailing: ElevatedButton(onPressed: (){
            Get.toNamed(AppRoutes.home);
          }, child: Text(
            'go straight to profile'
          )),
        ),
      ),
    );
  }
}
