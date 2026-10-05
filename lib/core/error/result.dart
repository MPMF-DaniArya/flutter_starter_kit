import 'failure.dart';

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;

  bool get isError => this is Error<T>;
}

final class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

final class Error<T> extends Result<T> {
  final Failure failure;

  const Error(this.failure);
}
