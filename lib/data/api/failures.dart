class Failures {
  String? errorMessage;
  int? code;

  Failures({required this.errorMessage, required this.code});

  @override
  String toString() {
    return "Failures(errorMessage: $errorMessage, code: $code)";
  }
}

class ServerError extends Failures {
  ServerError({required super.errorMessage, required super.code});
}

class NetworkError extends Failures {
  NetworkError({required super.errorMessage, required super.code});
}
