import 'package:dartz/dartz.dart';
import 'package:flutter_mobile_challenge_2021/app/app_module.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/entities/patient.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/repositories/patient_repository.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/usecases/get_patients_usecase.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PatientRepositoryMock extends Mock implements PatientRepository {}

main() {
  final _patientRepositoryMock = PatientRepositoryMock();
  final _getPatientsUsecase = GetPatientsUsecaseImpl(_patientRepositoryMock);
  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][DOMAIN][UNIT]'
    'should return a [GetPatientsUsecase] instance without error',
    () async {
      initModule(AppModule());
      initModule(HomeModule());
      final _result = Modular.get<GetPatientsUsecase>();
      expect(_result, isA<GetPatientsUsecase>());
    },
  );

  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][DOMAIN][UNIT]'
    'should return a [Patient] list without error',
    () async {
      when(_patientRepositoryMock.getPatients(any, any, any))
          .thenAnswer((_) async => Right(List<Patient>()));

      String _seedMock = 'abc';
      int _pageMock = 1;
      int _resultsMock = 50;
      final _result =
          await _getPatientsUsecase(_seedMock, _pageMock, _resultsMock);
      expect(_result | null, isA<List<Patient>>());
    },
  );
}
