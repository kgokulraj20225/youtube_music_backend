import 'package:demo_flutter_project/app/modules/backend_songs_name_display/backend_hand_controller/backend_hand_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class display_song extends StatefulWidget {
  const display_song({super.key});

  @override
  State<display_song> createState() => _display_songState();
}

class _display_songState extends State<display_song> {
  @override
  Widget build(BuildContext context) {
    final song_controllers controller =Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Obx((){
        if(controller.isloading.value){
          print('songs ${controller.songs_name_list}');
          return CircularProgressIndicator();
        }
        // if(controller.songs_name_list.isEmpty){
        //   return Center(child: Text('no song found'),);
        // }
        return ListView.builder(
          itemCount: controller.songs_name_list.length,
            itemBuilder: (_,index){
          var songs=controller.songs_name_list[index];
          return ListTile(
            leading:songs.coverImage!=null?Image.network(songs.coverImage!):Text('no image'),
            title: Text('${songs.title ?? 'name'}'),
            subtitle: songs.genre!.isEmpty && songs.genre==null ? Text('no artist details'):Text(songs.genre!.map((a) => a.genre).join(', ')),
          );
        });
      }),
    );
  }
}
