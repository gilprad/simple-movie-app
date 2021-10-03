class AppHttpClientException<OriginalException extends Exception>
    implements Exception {
  AppHttpClientException({required this.exception});

  final OriginalException exception;
}

enum AppNetworkExceptionReason {
  canceled,

  timedOut,

  responseError
}

class AppNetworkException<OriginalException extends Exception>
    extends AppHttpClientException<OriginalException> {
  AppNetworkException({
    required this.reason,
    required OriginalException exception,
  }) : super(exception: exception);

  final AppNetworkExceptionReason reason;
}

class AppNetworkResponseException<OriginalException extends Exception, DataType>
    extends AppNetworkException<OriginalException> {
  AppNetworkResponseException({
    required OriginalException exception,
    this.statusCode,
    this.data,
  }) : super(
          reason: AppNetworkExceptionReason.responseError,
          exception: exception,
        );

  final DataType? data;

  final int? statusCode;

  bool get hasData => data != null;

  bool validateStatusCode(bool Function(int statusCode) evaluator) {
    final statusCode = this.statusCode;
    if (statusCode == null) return false;
    return evaluator(statusCode);
  }
}
