import 'package:flutter_starter_kit/core/config/app_environment.dart';

final class EnvironmentConfig {
  final AppEnvironment environment;
  final Uri apiBaseUrl;

  const EnvironmentConfig({
    required this.environment,
    required this.apiBaseUrl,
  });

  bool get isTesting =>
      environment == AppEnvironment.testing;

  bool get isProduction =>
      environment == AppEnvironment.production;
}
