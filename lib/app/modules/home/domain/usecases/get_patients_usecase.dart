import 'package:dartz/dartz.dart';

import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/entities/patient.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/repositories/patient_repository.dart';
import 'package:flutter_mobile_challenge_2021/core/failures/failures.dart';

abstract class GetPatientsUsecase {
  Future<Either<Failure, List<Patient>>> call(
      String seed, int page, int results);
}

class GetPatientsUsecaseImpl implements GetPatientsUsecase {
  PatientRepository _patientRepository;
  GetPatientsUsecaseImpl(
    this._patientRepository,
  );

  @override
  Future<Either<Failure, List<Patient>>> call(
      String seed, int page, int results) async {
    return await _patientRepository.getPatients(seed, page, results);
  }
}
