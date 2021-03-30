import 'dart:convert';

class DobModel {
  final DateTime date;
  final String age;

  DobModel(
    this.date,
    this.age,
  );

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'age': age,
    };
  }

  factory DobModel.fromMap(Map<String, dynamic> map) {
    return DobModel(
      DateTime.fromMillisecondsSinceEpoch(map['date']),
      map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DobModel.fromJson(String source) =>
      DobModel.fromMap(json.decode(source));
}
