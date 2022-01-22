abstract class FailureProductInterface implements Exception {
  String get message;
}

class ErrorUpdateProduct implements FailureProductInterface {
  @override
  final String message;
  ErrorUpdateProduct({required this.message});
}
