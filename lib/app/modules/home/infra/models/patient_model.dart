import 'dart:convert';

import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/dob_model.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/location_model.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/name_model.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/entities/patient.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/picture_model.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/id_model.dart';

class PatientModel extends Patient {
  final IdModel id;
  final NameModel name;
  final String gender;
  final String phone;
  final DobModel dob;
  final String email;
  final String nat;
  final LocationModel location;
  final PictureModel picture;

  PatientModel(
    this.id,
    this.name,
    this.gender,
    this.phone,
    this.dob,
    this.email,
    this.nat,
    this.location,
    this.picture,
  ) : super(
          id,
          name,
          gender,
          phone,
          dob,
          email,
          nat,
          location,
          picture,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id.toMap(),
      'name': name.toMap(),
      'gender': gender,
      'phone': phone,
      'dob': dob.toMap(),
      'email': email,
      'nat': nat,
      'location': location.toMap(),
      'picture': picture.toMap(),
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      IdModel.fromMap(map['id']),
      NameModel.fromMap(map['name']),
      map['gender'],
      map['phone'],
      DobModel.fromMap(map['dob']),
      map['email'],
      map['nat'],
      LocationModel.fromMap(map['location']),
      PictureModel.fromMap(map['picture']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) =>
      PatientModel.fromMap(json.decode(source));
}
