import 'package:flutter/material.dart';
import 'package:get/get.dart';

class twoth_page extends StatefulWidget {
  const twoth_page({super.key});

  @override
  State<twoth_page> createState() => _twoth_pageState();
}

class _twoth_pageState extends State<twoth_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            GestureDetector(
              onTap: (){
                Get.back(result: Colors.black);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ),GestureDetector(
              onTap: (){
                Get.back(result: Colors.yellow);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),GestureDetector(
              onTap: (){
                Get.back(result: Colors.green);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),GestureDetector(
              onTap: (){
                Get.back(result: Colors.blue);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
