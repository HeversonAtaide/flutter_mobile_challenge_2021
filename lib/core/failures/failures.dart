abstract class Failure implements Exception {
  String errorMessage;
  printErrorOnConsole();
}

class UnknownError implements Failure {
  @override
  String errorMessage = 'Erro desconhecido';

  @override
  printErrorOnConsole() {
    print('>> UnknownError: $errorMessage');
  }
}

class NoInternetConnection implements Failure {
  @override
  String errorMessage = 'Sem conexão com a internet';

  @override
  printErrorOnConsole() {
    print('>> NoInternetConnection: $errorMessage');
  }
}
