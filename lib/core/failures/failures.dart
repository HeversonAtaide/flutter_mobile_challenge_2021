abstract class Failure implements Exception {
  String errorMessage;
  printErrorOnConsole();
}

class UnknownError implements Failure {
  @override
  String errorMessage = 'Uh oh, something has gone wrong';

  @override
  printErrorOnConsole() {
    print('>> UnknownError: $errorMessage');
  }
}

class NoInternetConnection implements Failure {
  @override
  String errorMessage = 'No internet connection';

  @override
  printErrorOnConsole() {
    print('>> NoInternetConnection: $errorMessage');
  }
}
