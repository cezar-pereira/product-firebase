abstract class FailureProductInterface implements Exception {
  String get message;
}

class ErrorFetchProducts implements FailureProductInterface {
  @override
  final String message;
  ErrorFetchProducts({required this.message});
}

class ErrorFetchImageProduct implements FailureProductInterface {
  @override
  final String message;
  ErrorFetchImageProduct({required this.message});
}
