// import 'package:demo_flutter_project/app/routes/app_route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../controller_getstorage/controller_getstore.dart';
//
// class login_use_getstore extends StatefulWidget {
//   const login_use_getstore({super.key});
//
//   @override
//   State<login_use_getstore> createState() => _login_use_getstoreState();
// }
//
// class _login_use_getstoreState extends State<login_use_getstore> {
//   final checkloginlogout controller= Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(onPressed: (){
//             controller.checklogin();
//           }, child: Text('login')),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(onPressed: (){
//             Get.offAllNamed(AppRoutes.home_page_using_get);
//           }, child: Text('straight to home')),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_route.dart';
// import 'routes.dart';

class LoginPage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                box.write('login', true);
                Get.offAllNamed(AppRoutes.home_page_using_get
                );
              },
              child: Text("Login and go Home"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate "unauth user clicking straight Home button"
                Get.toNamed(AppRoutes.home_page_using_get);
              },
              child: Text("Go to Home (unauth)"),
            ),
          ],
        ),
      ),
    );
  }
}

