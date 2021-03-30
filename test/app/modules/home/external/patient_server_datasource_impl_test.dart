import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mobile_challenge_2021/app/app_module.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/external/patient_server_datasource_impl.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/home_module.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/datasources/patient_datasource.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/patient_model.dart';
import 'package:flutter_mobile_challenge_2021/core/failures/patient_failure.dart';
import 'package:flutter_mobile_challenge_2021/core/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final _dioMock = DioMock();
  final _patientServerDatasourceImpl = PatientServerDatasourceImpl(_dioMock);
  String _seedMock = 'abc';
  int _pageMock = 1;
  int _resultsMock = 50;

  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][EXTERNAL][UNIT]'
    'should return a [PatientServerDatasource] instance without error.',
    () async {
      initModule(AppModule());
      initModule(HomeModule());
      final _result = Modular.get<PatientServerDatasource>();
      expect(_result, isA<PatientServerDatasource>());
    },
  );

  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][EXTERNAL][UNIT]'
    'should return a [PatientModel] list,'
    'when the server result is 200.',
    () async {
      String json = await Utils.parseJsonFromAssets(
          'assets/json/patient_list_one_test.json');
      when(_dioMock.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer(
              (_) async => Response(data: jsonDecode(json), statusCode: 200));
      try {
        final _result = await _patientServerDatasourceImpl.getPatients(
            _seedMock, _pageMock, _resultsMock);
        expect(_result, isA<List<PatientModel>>());
      } catch (e) {}
    },
  );

  test(
    // [MODULE][LAYER][TESTTYPE]
    '[HOME][EXTERNAL][UNIT]'
    'should return a [GetPatientsServerDatasourceError],'
    'when server result is different than 200.',
    () async {
      when(_dioMock.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => Response(data: null, statusCode: 401));
      try {
        await _patientServerDatasourceImpl.getPatients(
            _seedMock, _pageMock, _resultsMock);
      } catch (e) {
        expect(e, isA<GetPatientsServerDatasourceError>());
      }
    },
  );
}
