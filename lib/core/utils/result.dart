class Result<T> {
  final T? data;      // Valor de éxito
  final String? error;  // Mensaje de error

  Result._({this.data, this.error});

  factory Result.success(T data) {
    return Result._(data: data);
  }

  factory Result.failure(String error) {
    return Result._(error: error);
  }

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}