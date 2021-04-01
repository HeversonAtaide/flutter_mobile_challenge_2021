import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failures/failures.dart';
import '../../domain/entities/patient.dart';
import '../../domain/repositories/patient_repository.dart';
import '../datasources/patient_datasource.dart';

class PatientRepositoryImpl implements PatientRepository {
  final Connectivity _connectivity;
  final PatientServerDatasource _patientServerDatasource;

  PatientRepositoryImpl(
    this._connectivity,
    this._patientServerDatasource,
  );
  @override
  Future<Either<Failure, List<Patient>>> getPatients(
      String seed, int page, int results) async {
    ConnectivityResult _connectivityResult =
        await _connectivity.checkConnectivity();

    if (_connectivityResult != null &&
        _connectivityResult != ConnectivityResult.none) {
      try {
        final _result =
            await _patientServerDatasource.getPatients(seed, page, results);
        return Right(_result);
      } catch (e) {
        if (e is Failure) {
          return Left(e);
        } else {
          return Left(UnknownError());
        }
      }
    } else {
      throw NoInternetConnection();
    }
  }
}
