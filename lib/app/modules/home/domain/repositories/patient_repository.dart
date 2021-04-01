import 'package:dartz/dartz.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/entities/patient.dart';
import 'package:flutter_mobile_challenge_2021/core/failures/failures.dart';

abstract class PatientRepository {
  Future<Either<Failure, List<Patient>>> getPatients(
      String seed, int page, int results);
}
