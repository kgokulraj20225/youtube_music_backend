// import 'package:demo_flutter_project/app/modules/login_using_getstorage/pages_getstorage/login_getstore.dart';
// import 'package:demo_flutter_project/app/routes/app_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../../modules/login_using_getstorage/controller_getstorage/controller_getstore.dart';
// import '../../modules/login_with_indirect/claim_premium.dart';
//
//
// class PremiumBannerMiddleware extends GetMiddleware {
//   // final checkloginlogout controller = Get.put(checkloginlogout());
//   @override
//   Widget onPageBuilt(Widget page) {
//     bool isPremium = GetStorage().read("login") ?? false;
//     // print('the prime: $isPremium ${controller.message}');
//
//     if(page.runtimeType == AppRoutes.login_using_get) return page;
//     if (!isPremium) {
//       return SafeArea(
//         child: Scaffold(
//           body: Center(
//             child: Column(
//               children: [
//                 Container(
//                   color: Colors.yellow,
//                   padding: EdgeInsets.all(8),
//                   child: Text("🚀 must login!", style: TextStyle(fontSize: 16)),
//                 ),
//                 Expanded(child: page),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//     return page; // if premium, show normal page
//   }
// }
//
// class unauthguard extends GetMiddleware{
//   final box=GetStorage();
//
//
//   @override
//   List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
//     bool isLoggedIn = box.read('login') ?? false;
//
//     if (!isLoggedIn) {
//       // 🚫 Prevent Home binding creation
//       Future.microtask(() => Get.offNamed(AppRoutes.login_using_get));
//       return [];
//     }
//
//     // ✅ Allow Home bindings to load
//     return bindings;
//   }
//
//   //
//   // @override
//   // Widget Function()? onPageBuildStart(Widget Function()? page){
//   //   bool check_unauth= box.read('login')??false;
//   //   if(!check_unauth){
//   //     return ()=> login_use_getstore();
//   //   }
//   //   return page;
//   // }
//
// }
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../app_route.dart';


class AuthGuard extends GetMiddleware {
  final box = GetStorage();

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    bool isLoggedIn = box.read('login') ?? false;

    if (!isLoggedIn) {
      print("⛔ User not logged in → Skipping HomeBinding creation");

      // Schedule navigation after current frame
      Future.microtask(() => Get.offAllNamed(AppRoutes.login_using_get));

      // Return empty list → prevent HomeBinding injection
      return null;
    }

    // Allow bindings if logged in
    return bindings;
  }
}

