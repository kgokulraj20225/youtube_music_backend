import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class claim_premium extends StatefulWidget {
  const claim_premium({super.key});

  @override
  State<claim_premium> createState() => _claim_premiumState();
}

class _claim_premiumState extends State<claim_premium> {
  Future<void> premium()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool('premium', true);
    Get.offNamed(AppRoutes.premium);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('tap to unlock the premium feature'),

      ),
      bottomSheet: PreferredSize(preferredSize: Size.fromHeight(30),  child: ElevatedButton(onPressed: (){
        premium();
      }, child: Text("go to premium"))),

    );
  }
}
