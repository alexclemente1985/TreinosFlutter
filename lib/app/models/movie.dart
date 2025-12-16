
import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.overview,
  });

  String getPosterImage(){
    return imageUrlPrefix + imageUrl;
  }
  

  Movie copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? releaseDate,
    String? overview,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      releaseDate: releaseDate ?? this.releaseDate,
      overview: overview ?? this.overview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['poster_path'] as String,
      releaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, imageUrl: $imageUrl, releaseDate: $releaseDate, overview: $overview)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.imageUrl == imageUrl &&
      other.releaseDate == releaseDate &&
      other.overview == overview;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      releaseDate.hashCode ^
      overview.hashCode;
  }
}
