// class Songs {
//   int? id;
//   List<Artists>? artists;
//   List<Genre>? genre;
//   String? title;
//   String? duration;
//   String? releaseDate;
//   String? songs;
//   String? coverImage;
//   String? lyrics;
//   String? language;
//   int? views;
//   int? likesCount;
//
//   Songs(
//       {this.id,
//         this.artists,
//         this.genre,
//         this.title,
//         this.duration,
//         this.releaseDate,
//         this.songs,
//         this.coverImage,
//         this.lyrics,
//         this.language,
//         this.views,
//         this.likesCount});
//
//   Songs.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     if (json['artists'] != null) {
//       artists = <Artists>[];
//       json['artists'].forEach((v) {
//         artists!.add(new Artists.fromJson(v));
//       });
//     }
//     if (json['genre'] != null) {
//       genre = <Genre>[];
//       json['genre'].forEach((v) {
//         genre!.add(new Genre.fromJson(v));
//       });
//     }
//     title = json['title'];
//     duration = json['duration'];
//     releaseDate = json['release_date'];
//     songs = json['songs'];
//     coverImage = json['cover_image'];
//     lyrics = json['lyrics'];
//     language = json['language'];
//     views = json['views'];
//     likesCount = json['likes_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.artists != null) {
//       data['artists'] = this.artists!.map((v) => v.toJson()).toList();
//     }
//     if (this.genre != null) {
//       data['genre'] = this.genre!.map((v) => v.toJson()).toList();
//     }
//     data['title'] = this.title;
//     data['duration'] = this.duration;
//     data['release_date'] = this.releaseDate;
//     data['songs'] = this.songs;
//     data['cover_image'] = this.coverImage;
//     data['lyrics'] = this.lyrics;
//     data['language'] = this.language;
//     data['views'] = this.views;
//     data['likes_count'] = this.likesCount;
//     return data;
//   }
// }
//
// class Artists {
//   int? id;
//   String? artiestName;
//   String? artistBio;
//   String? artistImage;
//   String? country;
//
//   Artists(
//       {this.id,
//         this.artiestName,
//         this.artistBio,
//         this.artistImage,
//         this.country});
//
//   Artists.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     artiestName = json['artiest_name'];
//     artistBio = json['artist_bio'];
//     artistImage = json['artist_image'];
//     country = json['country'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['artiest_name'] = this.artiestName;
//     data['artist_bio'] = this.artistBio;
//     data['artist_image'] = this.artistImage;
//     data['country'] = this.country;
//     return data;
//   }
// }
//
// class Genre {
//   int? id;
//   String? genre;
//   String? description;
//
//   Genre({this.id, this.genre, this.description});
//
//   Genre.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     genre = json['genre'];
//     description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['genre'] = this.genre;
//     data['description'] = this.description;
//     return data;
//   }
// }

class Songs {
  int? id;
  List<Artists>? artists;
  List<Genre>? genre;
  String? title;
  String? duration;
  String? releaseDate;
  String? songs;
  String? coverImage;
  String? lyrics;
  String? language;
  int? views;
  int? likesCount;

  Songs({
    this.id,
    this.artists,
    this.genre,
    this.title,
    this.duration,
    this.releaseDate,
    this.songs,
    this.coverImage,
    this.lyrics,
    this.language,
    this.views,
    this.likesCount,
  });

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(Artists.fromJson(v));
      });
    }
    if (json['genre'] != null) {
      genre = <Genre>[];
      json['genre'].forEach((v) {
        genre!.add(Genre.fromJson(v));
      });
    }
    title = json['title'];
    duration = json['duration'];
    releaseDate = json['release_date'];
    songs = json['songs'];
    coverImage = json['cover_image'];
    lyrics = json['lyrics'];
    language = json['language'];
    views = json['views'];
    likesCount = json['likes_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    if (genre != null) {
      data['genre'] = genre!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['duration'] = duration;
    data['release_date'] = releaseDate;
    data['songs'] = songs;
    data['cover_image'] = coverImage;
    data['lyrics'] = lyrics;
    data['language'] = language;
    data['views'] = views;
    data['likes_count'] = likesCount;
    return data;
  }
}

class Artists {
  int? id;
  String? artiestName;
  String? artistBio;
  String? artistImage;
  String? country;

  Artists({this.id, this.artiestName, this.artistBio, this.artistImage, this.country});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artiestName = json['artiest_name'];
    artistBio = json['artist_bio'];
    artistImage = json['artist_image'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['artiest_name'] = artiestName;
    data['artist_bio'] = artistBio;
    data['artist_image'] = artistImage;
    data['country'] = country;
    return data;
  }
}

class Genre {
  int? id;
  String? genre;
  String? description;

  Genre({this.id, this.genre, this.description});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genre = json['genre'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['genre'] = genre;
    data['description'] = description;
    return data;
  }
}
