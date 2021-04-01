import 'dart:convert';

class StreetModel {
  final int number;
  final String name;

  StreetModel(
    this.number,
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory StreetModel.fromMap(Map<String, dynamic> map) {
    return StreetModel(
      map['number'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StreetModel.fromJson(String source) =>
      StreetModel.fromMap(json.decode(source));
}
