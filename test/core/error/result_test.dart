import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter_kit/core/error/failure.dart';
import 'package:flutter_starter_kit/core/error/result.dart';

void main() {
  group('Result', () {
    test(
      'Success stores data and reports isSuccess true',
          () {
        const result = Success<String>('success');

        expect(result.data, 'success');
        expect(result.isSuccess, isTrue);
        expect(result.isError, isFalse);
      },
    );

    test(
      'Error stores failure and reports isError true',
          () {
        const failure = ServerFailure(
          message: 'Server error.',
        );

        const result = Error<String>(failure);

        expect(result.failure, same(failure));
        expect(result.isSuccess, isFalse);
        expect(result.isError, isTrue);
      },
    );
  });
}