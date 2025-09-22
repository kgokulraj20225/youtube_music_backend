// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../controller_getstorage/controller_getstore.dart';
//
// class home_use_getstore extends StatefulWidget {
//   const home_use_getstore({super.key});
//
//   @override
//   State<home_use_getstore> createState() => _home_use_getstoreState();
// }
//
// class _home_use_getstoreState extends State<home_use_getstore> {
//   final checkloginlogout controller = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     print('the message when binding call : ${controller.message}');
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: (){
//             controller.logout();
//           }, icon:Icon(Icons.logout))
//         ],
//       ),
//       body: Center(
//         child: Container(
//           child: Obx(()=>Text('${controller.message}')),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:demo_flutter_project/app/routes/app_route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../controller_getstorage/controller_getstore.dart';
//
//
// class HomePage extends StatelessWidget {
//   final box=GetStorage();
//   @override
//   Widget build(BuildContext context) {
//     if (!Get.isRegistered<HomeController>()) {
//       return Scaffold(
//         body: SizedBox(), // temporary safe screen
//       );
//     }
//     final HomeController cont=Get.find<HomeController>();
//     print("🏠 HomePage build running"); // 🔹 Only prints if page builds and controller exists
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Home Page")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Welcome Home! "),
//           ElevatedButton(onPressed: (){
//             box.remove('login');
//             Get.offAllNamed(AppRoutes.login_using_get);
//           }, child: Text('logout'))
//         ],
//       ),
//     );
//   }
// }

import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:demo_flutter_project/app/routes/middleware/middle_dispose.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home_use_dispose extends StatefulWidget {
  const home_use_dispose({super.key});

  @override
  State<home_use_dispose> createState() => _home_use_disposeState();
}

class _home_use_disposeState extends State<home_use_dispose> {
  final middle_dispose middleware = middle_dispose();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Text('the timer is running'),
          ),
          ElevatedButton(onPressed: (){
            // middleware.onPageDispose();
            Get.offNamed(AppRoutes.second_demo_page_get);
          }, child: Text('go to second page')),
        ],
      ),
    );
  }
}
