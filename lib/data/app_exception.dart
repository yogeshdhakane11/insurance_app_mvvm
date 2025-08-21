class AppException implements Exception {
  final _massage;
  final _prefx;
  AppException([this._massage, this._prefx]);

  @override
  String toString() {
    return '$_prefx$_massage';
  }
}

class FeatchDataException extends AppException {
  FeatchDataException([String? massage])
    : super(massage, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? massage]) : super(massage, 'Invalid Request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? massage])
    : super(massage, 'Unauthorised Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? massage]) : super(massage, 'Invalid Input');
}

class AuthenticationFailedException extends AppException {
  AuthenticationFailedException([String? message])
    : super(message, 'Authentication Failed');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'Access Denied');
}
