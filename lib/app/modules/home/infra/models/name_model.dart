import 'dart:convert';

class NameModel {
  final String title;
  final String first;
  final String last;

  NameModel(
    this.title,
    this.first,
    this.last,
  );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      map['title'],
      map['first'],
      map['last'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source) =>
      NameModel.fromMap(json.decode(source));
}
