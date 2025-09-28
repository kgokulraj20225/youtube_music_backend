import 'package:demo_flutter_project/app/middleware_task/onpagecalled_task/controller_opc/controller_opc.dart';
import 'package:demo_flutter_project/app/models/songs_details.dart';
import 'package:demo_flutter_project/app/services/song_service.dart';
import 'package:get/get.dart';

class songsshowcontroller extends GetxController {
  final songService _sservice = songService();

  var songsList = <Songs>[].obs;
  var isloading = false.obs;

  @override
  void onInit() {
    fetch_songs();
    super.onInit();
  }

  void fetch_songs() async {
    try {
      isloading(true);
      songsList.value= await _sservice.getSongs();
      print('song list $songsList');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isloading(false);
    }
  }
}
