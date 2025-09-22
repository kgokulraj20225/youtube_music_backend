import 'package:demo_flutter_project/app/modules/first_api_service/controller_api/songs_controller.dart';
import 'package:get/get.dart';

class song_binding extends Bindings{
  @override
  void dependencies() {
    Get.put(songsshowcontroller());
  }
}