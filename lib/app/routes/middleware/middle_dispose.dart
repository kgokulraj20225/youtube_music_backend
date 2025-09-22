import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class middle_dispose extends GetMiddleware{
  Timer? _timer;

  @override
  Widget Function()? onPageBuildStart(Widget Function()? page) {
    print("🏠 HomePage is being built");
    _timer=Timer.periodic(Duration(seconds: 1),(timer){
      print('timer running $timer');
    });
    return page;
  }

  @override
  void onPageDispose() {
    _timer?.cancel();
  }
}