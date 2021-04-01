import 'failures.dart';

class GetPatientsServerDatasourceError implements Failure {
  @override
  String errorMessage =
      'It was not possible to search for patients on the server';

  @override
  printErrorOnConsole() {
    print('>> GetPatientsServerDatasourceError: $errorMessage');
  }
}
