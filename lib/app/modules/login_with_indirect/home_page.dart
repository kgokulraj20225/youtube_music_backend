import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {


  Future<void> exit_premium() async{
    SharedPreferences pre= await SharedPreferences.getInstance();
    pre.remove('premium');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            exit_premium();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: ListTile(
          title: Text(
            "home screen",
            style: TextStyle(fontSize: 25),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.setting);
                      },
                      child: Text('go to setting page')),
                  ElevatedButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.profile);
                      },
                      child: Text('go to profile page')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                Get.toNamed(AppRoutes.premium);
              }, child: Text('go to premium'))
            ],
          ),
        ),
      ),
    );
  }
}
