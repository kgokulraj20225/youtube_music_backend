import 'package:demo_flutter_project/app/middleware_task/onpagecalled_task/page_opc/home_page_only_authuser.dart';
import 'package:demo_flutter_project/app/middleware_task/onpagecalled_task/page_opc/premium.dart';
import 'package:demo_flutter_project/app/modules/login_using_getstorage/pages_getstorage/demo_two.dart';
import 'package:demo_flutter_project/app/modules/login_using_getstorage/pages_getstorage/login_getstore.dart';
import 'package:demo_flutter_project/app/modules/login_using_getstorage/pages_getstorage/logout_getstore.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/claim_premium.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/home_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/login_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/profile_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/settings_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/splash_screen.dart';
import 'package:demo_flutter_project/app/routes/middleware/authguard.dart';

import 'package:demo_flutter_project/app/routes/middleware/dis_unauthu.dart';
import 'package:demo_flutter_project/app/routes/middleware/middle_dispose.dart';
import 'package:get/get.dart';

import '../middleware_task/onpagecalled_task/binding_opc/binding_opc.dart';
import '../middleware_task/onpagecalled_task/page_opc/Login_auth_page.dart';
import '../modules/backend_songs_name_display/backend_hand_binding/backend_binding.dart';
import '../modules/backend_songs_name_display/backend_show_pages/display_backend_data.dart';
import '../modules/login_using_getstorage/binding_getstorage/binding_getstorage.dart';
import '../modules/login_with_indirect/premium_page.dart';
import 'middleware/Task/onbindingstartandend.dart';
import 'middleware/Task/onpagecalled.dart';
import 'middleware/premium.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const setting = '/setting';
  static const profile = '/profile/:id';
  static const premium ='/premium';
  static const claim_premium='/claim_pre';
  static const login_using_get='/login_page_use_get';
  static const home_page_using_get='/home_page_using_get';
  static const second_demo_page_get ='/second_demo_page';
  static const premium_page_auths = '/premium_page_auths';
  static const backend_hand_sample='/backend_hand_sample';


  static final route=[
    GetPage(name: splash, page: ()=>splash_screen()),
    GetPage(name: login, page: ()=>login_screen()),
    GetPage(name: home, page: ()=>home_screen()),
    GetPage(name: setting, page: ()=>setting_screen()),
    GetPage(name: profile, page: ()=>profile_screen(),middlewares: [authguard()]),
    GetPage(name: premium, page: ()=>priemum_screen()),
    GetPage(name: claim_premium, page: ()=>claim_premium_task()),
    GetPage(name: login_using_get, page: ()=>Login_auth_user_page(),binding: binding_login_auth()),
    GetPage(name: home_page_using_get, page: ()=>home_auth_user_page(),binding: other_homebinding(),middlewares: [loginguard(),onbindingstartend()]),
    GetPage(name: second_demo_page_get, page: ()=>second_demo_page(),binding: HomeBinding()),
    GetPage(name: premium_page_auths, page: ()=>premium_page_auth(),binding: binding_login_auth(),middlewares: [premiumguard()]),
    // GetPage(name: backend_hand_sample, page: ()=>display_song(),binding: backend_bindings()),
  ];
}
