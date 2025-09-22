class songs_name {
  String? title;
  int? id;
  String? coverImage;

  songs_name({this.title, this.id, this.coverImage});

  songs_name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    coverImage = json['cover_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['cover_image'] = this.coverImage;
    return data;
  }
}
