import 'package:get/get.dart';
import 'package:flutter/material.dart';


class second_demo_page extends StatefulWidget {
  const second_demo_page({super.key});

  @override
  State<second_demo_page> createState() => _second_demo_pageState();
}

class _second_demo_pageState extends State<second_demo_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Container(
          color: Colors.red,
          child: Text('this is the second page'),

        ),
      ),
    );
  }
}
