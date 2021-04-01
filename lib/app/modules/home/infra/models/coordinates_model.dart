import 'dart:convert';

class CoordinatesModel {
  final double latitude;
  final double longitude;

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
      double.parse(map['latitude']),
      double.parse(map['longitude']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordinatesModel.fromJson(String source) =>
      CoordinatesModel.fromMap(json.decode(source));
}
