import 'package:demo_flutter_project/app/modules/login_with_indirect/claim_premium.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


// class PremiumBannerMiddleware extends GetMiddleware {
//   @override
//   Widget onPageBuilt(Widget page) {
//     bool isPremium = GetStorage().read("login") ?? false;
//
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


// class PremiumGuard extends GetMiddleware {
//   @override
//   Widget Function()? onPageBuildStart(Widget Function()? page) {
//     bool isPremium = GetStorage().read("premium") ?? false;
//
//     if (!isPremium) {
//       // Replace with claim_premium page builder
//       return () => claim_premium();
//     }
//
//     // Otherwise, continue building original page
//     return page;
//   }
// }
//
