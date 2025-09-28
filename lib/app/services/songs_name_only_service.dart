import 'dart:convert';

import 'package:demo_flutter_project/app/models/songs_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/songs_names_only.dart';

class songs_only_serive {
  // static var backendurl = 'http://10.189.164.17:8000/songs/just_show_song_detials/';
  static var backendurl = 'http://10.189.164.17:8000/songs/songs_views';
  Future<List<Songs>> fetch_song() async {
    final response = await http.get(Uri.parse(backendurl));
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      final List<dynamic> songList= decode['results'];
      // List songList= decode['results'];

      print('backend $songList');

      return songList.map((e) => Songs.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch songs');
    }
  }
  // Future<List<songs_name>> fetch_song() async {
  //   final response = await http.get(Uri.parse(backendurl));
  //
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to fetch songs');
  //   }
  //
  //   // decode response
  //   final decoded = json.decode(response.body);
  //
  //   // pick correct key: "results"
  //   final List<dynamic> rawList = decoded['results'];
  //
  //   // convert each map into songs_name object
  //   return rawList.map((e) => songs_name.fromJson(e)).toList();
  // }

}


