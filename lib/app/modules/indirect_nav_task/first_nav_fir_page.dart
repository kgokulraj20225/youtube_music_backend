import 'package:flutter/material.dart';
import 'package:get/get.dart';

class indirect_nav extends StatefulWidget {
  @override
  State<indirect_nav> createState() => _indirect_navState();
}

class _indirect_navState extends State<indirect_nav> {
   Color resultcolor=Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: GestureDetector(
          onTap: ()async{
            var result= await Get.toNamed('/twoth');
            if(result!=null && result is Color){
              setState(() {
                resultcolor = result;
              });
            }
          },
          child: Container(
            height: 100,
            width: 100,
            color: resultcolor,
          ),
        ),
      ),
    );
  }
}
