import 'package:demo_flutter_project/app/middleware_task/onpagecalled_task/page_opc/premium.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/claim_premium.dart';
import 'package:demo_flutter_project/app/routes/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../middleware_task/onpagecalled_task/binding_opc/binding_opc.dart';
import '../../../middleware_task/onpagecalled_task/page_opc/Login_auth_page.dart';

class loginguard extends GetMiddleware {
  final store = GetStorage();

  @override
  GetPage? onPageCalled(GetPage? page) {
    bool auth = store.read('login_auth') ?? false;
    if (!auth && page?.name == AppRoutes.home_page_using_get) {
      return GetPage(
          name: AppRoutes.login_using_get,
          page: () => Login_auth_user_page(),
          binding: binding_login_auth());
    }
    return page;
  }
}

class premiumguard extends GetMiddleware {
  @override
  Widget Function()? onPageBuildStart(Widget Function()? page) {
    final store = GetStorage();
    bool premium = store.read('premium') ?? false;

    if (!premium) {
      return () => claim_premium_task();
    }
    return page;
  }
}
