import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/datasources/patient_datasource.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/patient_model.dart';

class PatientServerDatasourceImpl implements PatientServerDatasource {
  @override
  Future<List<PatientModel>> getPatients(String seed, int page, int results) {
    // TODO: implement getPatients
    throw UnimplementedError();
  }
}
