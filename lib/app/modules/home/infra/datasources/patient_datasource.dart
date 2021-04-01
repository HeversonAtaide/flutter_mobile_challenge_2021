import 'package:flutter_mobile_challenge_2021/app/modules/home/infra/models/patient_model.dart';

abstract class PatientServerDatasource {
  Future<List<PatientModel>> getPatients(String seed, int page, int results);
}
