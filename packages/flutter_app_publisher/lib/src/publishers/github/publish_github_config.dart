import 'dart:io';

import 'package:flutter_app_publisher/src/api/app_package_publisher.dart';

const kEnvGithubToken = 'GITHUB_TOKEN';
const kEnvGithubRepository = 'GITHUB_REPOSITORY';

class PublishGithubConfig extends PublishConfig {
  PublishGithubConfig({
    required this.token,
    required this.repository,
    this.releaseTitle,
    this.releaseDraft = false,
    this.releasePrerelease = false,
  });

  /// Parse GitHub configuration from environment variables and publish arguments.
  ///
  /// [environment] is the environment variables.
  /// [publishArguments] is the publish arguments.
  ///
  /// Returns a [PublishGithubConfig] object.
  /// Throws a [PublishError] if the configuration is invalid.
  factory PublishGithubConfig.parse(
    Map<String, String>? environment,
    Map<String, dynamic>? publishArguments,
  ) {
    final env = environment ?? Platform.environment;

    String? token = env[kEnvGithubToken];
    if ((token ?? '').isEmpty) {
      throw PublishError('Missing `$kEnvGithubToken` environment variable.');
    }

    String? repository = publishArguments?['repo'];
    String? releaseTitle = publishArguments?['release-title'];
    bool? releaseDraft = publishArguments?['release-draft'] == 'true';
    bool? releasePrerelease = publishArguments?['release-prerelease'] == 'true';

    if ((repository ?? '').trim().isEmpty) {
      repository = env[kEnvGithubRepository];
    }

    // For backward compatibility, we support `repo-owner` and `repo-name` arguments.
    if ((repository ?? '').trim().isEmpty) {
      String? repoOwner = publishArguments?['repo-owner'];
      String? repoName = publishArguments?['repo-name'];
      if ((repoOwner ?? '').trim().isNotEmpty &&
          (repoName ?? '').trim().isNotEmpty) {
        repository = '$repoOwner/$repoName';
      }
    }

    if ((repository ?? '').trim().isEmpty) {
      throw PublishError(
        'GitHub repository is required. '
        'Please provide it via `--github-repo` argument or `$kEnvGithubRepository` environment variable.',
      );
    }

    if (!RegExp(r'^[^/]+/[^/]+$').hasMatch(repository!)) {
      throw PublishError(
        'Invalid GitHub repository format. '
        'Expected format: `owner/repo` (e.g., `flutter/flutter`). '
        'Current value: `$repository`',
      );
    }

    PublishGithubConfig publishConfig = PublishGithubConfig(
      token: token!,
      repository: repository,
      releaseDraft: releaseDraft,
      releasePrerelease: releasePrerelease,
    );

    // Build release title with variable substitution support.
    // Supported variables:
    // - {appVersion}: Full version string (e.g., "1.0.0+1")
    // - {appBuildName}: Version without build number (e.g., "1.0.0")
    // - {appBuildNumber}: Build number only (e.g., "1")
    String appVersion = publishConfig.pubspec.version.toString();
    String appBuildName = appVersion.split('+').first;
    String appBuildNumber = appVersion.split('+').last;

    if ((releaseTitle ?? '').trim().isEmpty) {
      publishConfig.releaseTitle = 'v$appVersion';
    } else {
      publishConfig.releaseTitle = releaseTitle!
          .replaceAll('{appVersion}', appBuildName)
          .replaceAll('{appBuildName}', appBuildName)
          .replaceAll('{appBuildNumber}', appBuildNumber);
    }
    return publishConfig;
  }

  /// Personal access tokens
  final String token;

  /// GitHub repository
  String repository;

  /// GitHub release title
  String? releaseTitle;

  /// Whether to create a draft release
  bool releaseDraft;

  /// Whether to create a prerelease
  bool releasePrerelease;
}
