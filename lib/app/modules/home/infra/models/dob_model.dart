import 'dart:convert';

import 'package:intl/intl.dart';

class DobModel {
  final DateTime date;
  final int age;

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
      DateFormat("yyyy-MM-ddThh:mm:ss").parse(map['date']),
      map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DobModel.fromJson(String source) =>
      DobModel.fromMap(json.decode(source));
}
