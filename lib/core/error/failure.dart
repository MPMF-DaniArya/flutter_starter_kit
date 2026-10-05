sealed class Failure {
  final String message;
  final String? code;

  const Failure({required this.message, this.code});
}

final class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure({required super.message, super.code});
}

final class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

final class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required super.message, super.code});
}

final class AuthorizationFailure extends Failure {
  const AuthorizationFailure({required super.message, super.code});
}

final class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.code});
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message, super.code});
}

final class ConflictFailure extends Failure {
  const ConflictFailure({required super.message, super.code});
}

final class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

final class BusinessFailure extends Failure {
  const BusinessFailure({required super.message, super.code});
}

final class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.code});
}
