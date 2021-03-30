import 'Id.dart';
import 'dob.dart';
import 'location.dart';
import 'name.dart';
import 'picture.dart';

class Patient {
  final Id id;
  final Name name;
  final String gender;
  final String phone;
  final Dob dob;
  final String email;
  final String nat;
  final Location location;
  final Picture picture;

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
