import 'dart:convert';

import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/coordinates_model.dart';

import 'street_model.dart';
import 'timezone_model.dart';

class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final CoordinatesModel coordinates;
  final TimezoneModel timezone;

  LocationModel(
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  );

  Map<String, dynamic> toMap() {
    return {
      'street': street.toMap(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': coordinates.toMap(),
      'timezone': timezone.toMap(),
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      StreetModel.fromMap(map['street']),
      map['city'],
      map['state'],
      map['country'],
      map['postcode'].toString(),
      CoordinatesModel.fromMap(map['coordinates']),
      TimezoneModel.fromMap(map['timezone']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source));
}
