import 'dart:convert';

class TimezoneModel {
  final String offset;
  final String description;

  TimezoneModel(
    this.offset,
    this.description,
  );

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'description': description,
    };
  }

  factory TimezoneModel.fromMap(Map<String, dynamic> map) {
    return TimezoneModel(
      map['offset'],
      map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TimezoneModel.fromJson(String source) =>
      TimezoneModel.fromMap(json.decode(source));
}
