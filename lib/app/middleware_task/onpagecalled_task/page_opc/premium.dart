import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller_opc/controller_opc.dart';

class premium_page_auth extends StatefulWidget {
  const premium_page_auth({super.key});

  @override
  State<premium_page_auth> createState() => _premium_page_authState();
}

class _premium_page_authState extends State<premium_page_auth> {
  final Check_auth_user controller =Get.find<Check_auth_user>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Premium page'),
        actions: [
          IconButton(onPressed: () {
            controller.cancel_premium();
          }, icon: Icon(Icons.check_box_outlined))
        ],
      ),
      body: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text('this page is premium page'),
          ElevatedButton(onPressed: () {}, child: Text('get the content'))
        ],
      ),
    );
  }
}

class claim_premium_task extends StatefulWidget {
  const claim_premium_task({super.key});

  @override
  State<claim_premium_task> createState() => _claim_premiumState();
}

class _claim_premiumState extends State<claim_premium_task> {
  final Check_auth_user controller =Get.find();
  Widget text(double top, double left, double right, double botom, String data,
      double fontsize, FontWeight fw) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: botom, left: left, right: right),
      child: Text(data,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: fw,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Premium plans ',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Card(
          child: Container(
            height: 450,
            width: 300,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                text(18, 0, 0, 10, 'Business', 15, FontWeight.bold),
                text(0, 0, 0, 0, '\$59', 60, FontWeight.bold),
                text(0, 0, 0, 10, 'per month', 18, FontWeight.normal),
                Divider(
                  endIndent: 45,
                  indent: 45,
                  color: Colors.black,
                ),
                text(5, 0, 0, 5, '15 users', 18, FontWeight.normal),
                text(5, 0, 0, 5, 'Feature 2', 18, FontWeight.normal),
                text(5, 0, 0, 5, 'Feature 3', 18, FontWeight.normal),
                text(5, 0, 0, 15, 'Feature 4', 18, FontWeight.normal),
                OutlinedButton(onPressed: (){
                  controller.claim_premiumd();
                  Get.toNamed(AppRoutes.premium_page_auths);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.black
                ),
                    child: Text('Upgrade to Premium',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
