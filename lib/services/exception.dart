class AppException implements Exception {
  final _message;
  AppException([this._message]);

  String toString() {
    return "$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message]) : super(message);
}

class NoInternetException extends AppException {
  NoInternetException([message]) : super(message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message);
}

class InvalidResponseException extends AppException {
  InvalidResponseException([String message]) : super(message);
}

class DataNotFoundException extends AppException {
  DataNotFoundException([String message]) : super(message);
}

class FailedException extends AppException {
  FailedException([String message]) : super(message);
}

class UnknownException extends AppException {
  UnknownException([String message]) : super(message);
}
