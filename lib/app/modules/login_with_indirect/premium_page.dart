import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class priemum_screen extends StatefulWidget {
  const priemum_screen({super.key});

  @override
  State<priemum_screen> createState() => _priemum_screenState();
}

class _priemum_screenState extends State<priemum_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.deepOrange,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.white54,
          ),Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
          ElevatedButton(onPressed: (){
            Get.back();
          }, child: Text('go back'))
        ],
      ),
    );
  }
}
