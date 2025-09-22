import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/songs_names_only.dart';

class songs_only_serive {
  static var backendurl = 'http://10.220.100.167:8000/songs/just_show_song_detials/';

  Future<List<songs_name>> fetch_song() async {
    final response = await http.get(Uri.parse(backendurl));
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      final songList = decode;
      print('$songList');

      return songList.map((e) => songs_name.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch songs');
    }
  }
}


