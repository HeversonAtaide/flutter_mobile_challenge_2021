import 'dart:convert';

class IdModel {
  final String name;
  final int value;

  IdModel(
    this.name, {
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory IdModel.fromMap(Map<String, dynamic> map) {
    return IdModel(
      map['name'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IdModel.fromJson(String source) =>
      IdModel.fromMap(json.decode(source));
}
