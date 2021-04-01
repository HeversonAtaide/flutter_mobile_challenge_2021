import 'package:dio/dio.dart';

import '../../../../core/consts/network_config.dart';
import '../../../../core/failures/patient_failure.dart';
import '../infra/datasources/patient_datasource.dart';
import '../infra/models/patient_model.dart';

class PatientServerDatasourceImpl implements PatientServerDatasource {
  final Dio _dio;

  PatientServerDatasourceImpl(this._dio);
  @override
  Future<List<PatientModel>> getPatients(
      String seed, int page, int results) async {
    // throw Exception();
    dynamic jsonResults = '';

    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    if (seed != null) {
      _queryParameters.putIfAbsent('seed', () => seed);
    }
    if (page != null) {
      _queryParameters.putIfAbsent('page', () => page);
    }
    if (results != null) {
      _queryParameters.putIfAbsent('results', () => results);
    }

    // if (kDebugMode) {
    //   await Future.delayed(Duration(milliseconds: 0), () async {});
    //   jsonResults = await Utils.parseJsonFromAssets(
    //       'assets/json/patient_list_one_test.json');
    // }

    final _serverResponse = await _dio.get(
      '${NetworkConfig.urlPatient}',
      queryParameters: _queryParameters,
    );
    if (_serverResponse.statusCode == 200) {
      jsonResults = await _serverResponse.data;
    } else {
      throw GetPatientsServerDatasourceError();
    }

    List<PatientModel> _patients = [];
    for (var patient in jsonResults['results']) {
      _patients.add(PatientModel.fromMap(patient));
    }

    return _patients;
  }
}
