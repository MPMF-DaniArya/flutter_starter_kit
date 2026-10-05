import 'app_exception.dart';
import 'failure.dart';

abstract final class FailureMapper {
  static Failure map(Object error) {
    if (error is! AppException) {
      return const UnknownFailure(
        message: 'Terjadi kesalahan yang tidak diketahui.',
      );
    }

    return switch (error) {
      NetworkException() => const NetworkFailure(
        message: 'Tidak ada koneksi internet. Periksa koneksi Anda dan coba kembali.',
      ),
      RequestTimeoutException() => const TimeoutFailure(
        message:
            'Permintaan membutuhkan waktu terlalu lama. Silakan coba kembali.',
      ),
      BadRequestException(:final userMessage, :final code) => ValidationFailure(
        message: userMessage ?? 'Permintaan tidak dapat diproses.',
        code: code,
      ),
      UnauthorizedException(:final code) => AuthenticationFailure(
        message:
            'Sesi Anda tidak valid atau telah berakhir. Silakan masuk kembali.',
        code: code,
      ),
      ForbiddenException(:final code) => AuthorizationFailure(
        message: 'Anda tidak memiliki akses untuk melakukan tindakan ini.',
        code: code,
      ),
      NotFoundException(:final userMessage, :final code) => NotFoundFailure(
        message: userMessage ?? 'Data yang diminta tidak ditemukan.',
        code: code,
      ),
      ConflictException(:final userMessage, :final code) => ConflictFailure(
        message:
            userMessage ?? 'Data tidak dapat diproses karena terjadi konflik.',
        code: code,
      ),
      ValidationException(:final userMessage, :final code) => ValidationFailure(
        message:
            userMessage ?? 'Data yang dikirim belum sesuai atau tidak valid.',
        code: code,
      ),
      ServerException(:final code) => ServerFailure(
        message: 'Terjadi gangguan pada server. Silakan coba kembali beberapa saat lagi.',
        code: code,
      ),
      CacheException(:final code) => CacheFailure(
        message: 'Data lokal tidak dapat diproses.',
        code: code,
      ),
      BusinessException(:final userMessage, :final code) => BusinessFailure(
        message: userMessage ?? 'Proses tidak dapat dilanjutkan saat ini.',
        code: code,
      ),
      UnknownAppException(:final code) => UnknownFailure(
        message: 'Terjadi kesalahan yang tidak diketahui.',
        code: code,
      ),
    };
  }
}
