import 'package:flutter_starter_kit/core/config/app_environment.dart';

import 'environment_config.dart';

abstract final class EnvironmentLoader {
  static EnvironmentConfig load() {
    const environmentValue = String.fromEnvironment('APP_ENV');

    const apiBaseUrlValue = String.fromEnvironment('API_BASE_URL');

    if (environmentValue.isEmpty) {
      throw StateError('APP_ENV is required');
    }

    if (apiBaseUrlValue.isEmpty) {
      throw StateError('API_BASE_URL is required');
    }

    final environment = switch (environmentValue) {
      'testing' => AppEnvironment.testing,
      'production' => AppEnvironment.production,
      _ => throw StateError('Unsupported APP_ENV: $environmentValue'),
    };

    final apiBaseUrl = Uri.tryParse(apiBaseUrlValue);

    if (apiBaseUrl == null ||
        !apiBaseUrl.hasScheme ||
        !apiBaseUrl.hasAuthority) {
      throw StateError('API_BASE_URL is invalid.');
    }

    if (environment == AppEnvironment.production &&
        apiBaseUrl.scheme != 'https') {
      throw StateError('Production API_BASE_URL must use HTTPS.');
    }

    return EnvironmentConfig(environment: environment, apiBaseUrl: apiBaseUrl);
  }
}
