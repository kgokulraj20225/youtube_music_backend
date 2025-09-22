import 'dart:convert';
import 'package:demo_flutter_project/app/models/songs_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class songService {
  static const baseUrl = 'http://10.155.7.73:8000/songs/songs_views/';

  Future<List<Songs>> getSongs() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      // ✅ Get "results" from response
      List data = decoded['results'];

      return data.map((e) => Songs.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch songs');
    }
  }
}
