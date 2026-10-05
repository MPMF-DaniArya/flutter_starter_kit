import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter_kit/core/error/app_exception.dart';
import 'package:flutter_starter_kit/core/error/failure.dart';
import 'package:flutter_starter_kit/core/error/failure_mapper.dart';

void main() {
  group('FailureMapper', () {
    test(
      'maps NetworkException to NetworkFailure',
          () {
        const exception = NetworkException();

        final result = FailureMapper.map(exception);

        expect(result, isA<NetworkFailure>());
      },
    );

    test(
      'maps RequestTimeoutException to TimeoutFailure',
          () {
        const exception = RequestTimeoutException();

        final result = FailureMapper.map(exception);

        expect(result, isA<TimeoutFailure>());
      },
    );

    test(
      'maps BadRequestException to ValidationFailure',
          () {
        const exception = BadRequestException(
          userMessage: 'Request tidak valid.',
          code: 'BAD_REQUEST',
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<ValidationFailure>());
        expect(result.message, 'Request tidak valid.');
        expect(result.code, 'BAD_REQUEST');
      },
    );

    test(
      'maps UnauthorizedException to AuthenticationFailure',
          () {
        const exception = UnauthorizedException();

        final result = FailureMapper.map(exception);

        expect(result, isA<AuthenticationFailure>());
      },
    );

    test(
      'maps ForbiddenException to AuthorizationFailure',
          () {
        const exception = ForbiddenException();

        final result = FailureMapper.map(exception);

        expect(result, isA<AuthorizationFailure>());
      },
    );

    test(
      'maps NotFoundException to NotFoundFailure',
          () {
        const exception = NotFoundException(
          userMessage: 'Data tidak ditemukan.',
          code: 'DATA_NOT_FOUND',
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<NotFoundFailure>());
        expect(result.message, 'Data tidak ditemukan.');
        expect(result.code, 'DATA_NOT_FOUND');
      },
    );

    test(
      'maps ConflictException to ConflictFailure',
          () {
        const exception = ConflictException(
          userMessage: 'Data sudah tersedia.',
          code: 'DATA_ALREADY_EXISTS',
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<ConflictFailure>());
        expect(result.message, 'Data sudah tersedia.');
        expect(result.code, 'DATA_ALREADY_EXISTS');
      },
    );

    test(
      'maps ValidationException to ValidationFailure',
          () {
        const exception = ValidationException(
          userMessage: 'Nomor handphone tidak valid.',
          code: 'INVALID_PHONE',
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<ValidationFailure>());
        expect(result.message, 'Nomor handphone tidak valid.');
        expect(result.code, 'INVALID_PHONE');
      },
    );

    test(
      'maps ServerException to ServerFailure',
          () {
        const exception = ServerException(
          statusCode: 500,
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<ServerFailure>());
      },
    );

    test(
      'maps CacheException to CacheFailure',
          () {
        const exception = CacheException();

        final result = FailureMapper.map(exception);

        expect(result, isA<CacheFailure>());
      },
    );

    test(
      'maps BusinessException to BusinessFailure',
          () {
        const exception = BusinessException(
          userMessage: 'Data sudah pernah dikirim.',
          code: 'DATA_ALREADY_SUBMITTED',
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<BusinessFailure>());
        expect(result.message, 'Data sudah pernah dikirim.');
        expect(result.code, 'DATA_ALREADY_SUBMITTED');
      },
    );

    test(
      'maps UnknownAppException to UnknownFailure',
          () {
        const exception = UnknownAppException();

        final result = FailureMapper.map(exception);

        expect(result, isA<UnknownFailure>());
      },
    );

    test(
      'maps non AppException to UnknownFailure',
          () {
        final exception = FormatException(
          'Invalid response format',
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<UnknownFailure>());
      },
    );

    test(
      'does not expose technical message as user-facing message',
          () {
        const exception = ServerException(
          technicalMessage:
          'SQL connection failed on internal server 10.0.0.1',
          statusCode: 500,
        );

        final result = FailureMapper.map(exception);

        expect(result, isA<ServerFailure>());
        expect(
          result.message,
          isNot(
            contains('10.0.0.1'),
          ),
        );
      },
    );
  });
}