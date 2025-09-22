import 'package:demo_flutter_project/app/modules/login_with_indirect/claim_premium.dart';
import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authguard extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route){
    bool loginin =false;
    SharedPreferences.getInstance().then((prf){
      loginin=prf.getBool('loginin')??false;
      print(loginin);
      if(!loginin && route==AppRoutes.profile){
        Get.offAllNamed(AppRoutes.login);
        // return const RouteSettings(name: '/login');
      }

    });
    return null;
  }
}
//
// class PremiumGuard extends GetMiddleware {
//   final bool premium;
//
//   PremiumGuard({required this.premium});
//
//   // ✅ Proper method override
//   @override
//   Widget Function()? Function(Widget Function()?)? onPageBuildStart() {
//     return (Widget Function()? page) {
//       // Swap widget dynamically if not premium
//
//       // Otherwise, show original page
//       return page;
//     };
//   }
// }
