import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_mobile_challenge_2021/app/app_module.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/entities/patient.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/repositories/patient_repository.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/home_module.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/datasources/patient_datasource.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/patient_model.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/repositories/patient_repository_impl.dart';
import 'package:flutter_mobile_challenge_2021/core/failures/patient_failure.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConnectivityMock extends Mock implements Connectivity {}

class PatientServerDatasourceMock extends Mock
    implements PatientServerDatasource {}

main() {
  final _connectivity = ConnectivityMock();
  final _patientServerDatasource = PatientServerDatasourceMock();
  final _patientRepository = PatientRepositoryImpl(
    _connectivity,
    _patientServerDatasource,
  );
  String _seedMock = 'abc';
  int _pageMock = 1;
  int _resultsMock = 50;

  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][INFRA][UNIT]'
    'should return a [PatientRepository] instance without error',
    () async {
      initModule(AppModule());
      initModule(HomeModule());
      final _result = Modular.get<PatientRepository>();
      expect(_result, isA<PatientRepository>());
    },
  );

  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][INFRA][UNIT]'
    'should return a [Patient] list from server (mocked) without error,'
    'when has internet,'
    'when the server search does not give an error.',
    () async {
      when(_connectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.wifi);
      when(_patientServerDatasource.getPatients(any, any, any))
          .thenAnswer((_) async => List<PatientModel>());

      final _result = await _patientRepository.getPatients(
          _seedMock, _pageMock, _resultsMock);
      verify(_connectivity.checkConnectivity());
      verify(_patientServerDatasource.getPatients(any, any, any));
      expect(_result | null, isA<List<Patient>>());
    },
  );

  test(
    // [MODULO][CAMADA][TIPOTESTE]
    '[HOME][INFRA][UNIT]'
    'should return a [GetPatientsServerDatasourceError],'
    'when [PatientServerDatasource] fails,'
    'when has internet',
    () async {
      when(_patientServerDatasource.getPatients(any, any, any))
          .thenThrow(GetPatientsServerDatasourceError());
      when(_connectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      final _result = await _patientRepository.getPatients(
          _seedMock, _pageMock, _resultsMock);
      verify(_patientServerDatasource.getPatients(any, any, any));
      verify(_connectivity.checkConnectivity());
      expect(_result.fold(id, id), isA<GetPatientsServerDatasourceError>());
    },
  );
}
