sealed class AppException implements Exception {
  final String? technicalMessage;
  final String? code;
  final int? statusCode;

  const AppException({
    this.technicalMessage,
    this.code,
    this.statusCode,
  });

  @override
  String toString() {
    return '$runtimeType('
        'technicalMessage: $technicalMessage, '
        'code: $code, '
        'statusCode: $statusCode'
        ')';
  }
}

final class NetworkException extends AppException {
  const NetworkException({
    super.technicalMessage,
    super.code,
  });
}

final class RequestTimeoutException extends AppException {
  const RequestTimeoutException({
    super.technicalMessage,
    super.code,
  });
}

final class BadRequestException extends AppException {
  final String? userMessage;

  const BadRequestException({
    this.userMessage,
    super.technicalMessage,
    super.code,
    super.statusCode = 400,
  });
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException({
    super.technicalMessage,
    super.code,
    super.statusCode = 401,
  });
}

final class ForbiddenException extends AppException {
  const ForbiddenException({
    super.technicalMessage,
    super.code,
    super.statusCode = 403,
  });
}

final class NotFoundException extends AppException {
  final String? userMessage;

  const NotFoundException({
    this.userMessage,
    super.technicalMessage,
    super.code,
    super.statusCode = 404,
  });
}

final class ConflictException extends AppException {
  final String? userMessage;

  const ConflictException({
    this.userMessage,
    super.technicalMessage,
    super.code,
    super.statusCode = 409,
  });
}

final class ValidationException extends AppException {
  final String? userMessage;

  const ValidationException({
    this.userMessage,
    super.technicalMessage,
    super.code,
    super.statusCode = 422,
  });
}

final class ServerException extends AppException {
  const ServerException({
    super.technicalMessage,
    super.code,
    super.statusCode,
  });
}

final class CacheException extends AppException {
  const CacheException({
    super.technicalMessage,
    super.code,
  });
}

final class BusinessException extends AppException {
  final String? userMessage;

  const BusinessException({
    this.userMessage,
    super.technicalMessage,
    super.code,
  });
}

final class UnknownAppException extends AppException {
  const UnknownAppException({
    super.technicalMessage,
    super.code,
    super.statusCode,
  });
}