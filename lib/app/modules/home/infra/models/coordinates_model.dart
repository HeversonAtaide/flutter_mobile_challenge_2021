import 'dart:convert';

class CoordinatesModel {
  final String latitude;
  final String longitude;

  CoordinatesModel(
    this.latitude,
    this.longitude,
  );

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory CoordinatesModel.fromMap(Map<String, dynamic> map) {
    return CoordinatesModel(
      map['latitude'],
      map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordinatesModel.fromJson(String source) =>
      CoordinatesModel.fromMap(json.decode(source));
}
