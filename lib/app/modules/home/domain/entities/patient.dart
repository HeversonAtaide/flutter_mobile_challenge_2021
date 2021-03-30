import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/id_model.dart';

import '../../infra/models/dob_model.dart';
import '../../infra/models/location_model.dart';
import '../../infra/models/name_model.dart';
import '../../infra/models/picture_model.dart';

class Patient {
  final IdModel id;
  final NameModel name;
  final String gender;
  final String phone;
  final DobModel dob;
  final String email;
  final String nat;
  final LocationModel location;
  final PictureModel picture;

  Patient(
    this.id,
    this.name,
    this.gender,
    this.phone,
    this.dob,
    this.email,
    this.nat,
    this.location,
    this.picture,
  );
}
