import 'package:demo_flutter_project/app/models/songs_details.dart';
import 'package:demo_flutter_project/app/models/songs_names_only.dart';
import 'package:get/get.dart';

import '../../../services/songs_name_only_service.dart';

class song_controllers extends GetxController {
  final songs_only_serive service = songs_only_serive();
  var songs_name_list = <Songs>[].obs;
  var isloading = false.obs;

  @override
  void onInit() {
    controller_fetch_songs();
    super.onInit();
  }

  void controller_fetch_songs() async {
    try {
      isloading(true);
      songs_name_list.value = await service.fetch_song();
      print("after this");
      print('backend data ${songs_name_list}');
    } catch (e) {
      Get.snackbar('error', e.toString());
      print('the controller value ${e.toString()}');
    } finally {
      isloading(false);
    }
  }
}
