import 'failures.dart';

class GetPatientsDatabaseDatasourceError implements Failure {
  @override
  String errorMessage =
      'Não foi possível buscar os pacientes no banco de dados';

  @override
  printErrorOnConsole() {
    print('>> GetPatientsDatabaseDatasourceError: $errorMessage');
  }
}

class CachePatientsDatabaseDatasourceError implements Failure {
  @override
  String errorMessage =
      'Não foi possível armazenar os pacientes no banco de dados';

  @override
  printErrorOnConsole() {
    print('>> CachePatientsDatabaseDatasourceError: $errorMessage');
  }
}

class GetPatientsServerDatasourceError implements Failure {
  @override
  String errorMessage = 'Não foi possível buscar os pacientes no servidor';

  @override
  printErrorOnConsole() {
    print('>> GetPatientsServerDatasourceError: $errorMessage');
  }
}
