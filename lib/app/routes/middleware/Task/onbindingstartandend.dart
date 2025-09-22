import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../middleware_task/onpagecalled_task/controller_opc/controller_opc.dart';

class onbindingstartend extends GetMiddleware{
  DateTime? start_time;
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? binding){
    start_time=DateTime.now();

    debugPrint("✅ Entered page at $start_time");
    return binding;
  }
  List<Bindings>? onBindingsEnd(List<Bindings>? binding) {
    // DateTime? endtime;
    //
    // if(start_time!=null){
    //   endtime=DateTime.now();
    //   final duration = endtime.difference(start_time!);
    //   debugPrint("🛑 Exited page at $endtime");
    //   debugPrint("📊 User stayed for ${duration.inSeconds} seconds");
    // }
    final check_only_auth_user controller= Get.find<check_only_auth_user>();
    controller.logout_auth();
    print('the onbindingend is trigger! ${controller.name}');
    return binding;

  }
}

