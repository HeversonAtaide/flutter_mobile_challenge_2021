import 'dart:convert';

class PictureModel {
  final String large;
  final String medium;
  final String thumbnail;

  PictureModel(
    this.large,
    this.medium,
    this.thumbnail,
  );

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory PictureModel.fromMap(Map<String, dynamic> map) {
    return PictureModel(
      map['large'],
      map['medium'],
      map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PictureModel.fromJson(String source) =>
      PictureModel.fromMap(json.decode(source));
}
