# Getting Started

Fastforge is an all-in-one Flutter application packaging and distribution tool, providing you with a one-stop solution to meet various distribution needs.

> **Name Change Notice:** ~~Flutter Distributor~~ has been renamed to Fastforge. If you were previously using ~~Flutter Distributor~~, please note that all functionality remains the same, but the package name, commands, and documentation have been updated to reflect this change.

## Installation

```
dart pub global activate fastforge
```

## Usage

Add `distribute_options.yaml` to your project root directory.

```yaml
output: dist/
```

### Configure A Publisher

Let's take `pgyer` as an example, after logging in, click the user avatar on the right side to go to the [API information](https://www.pgyer.com/account/api) page from the menu, copy the `API Key` and add it to the env node.

```yaml
variables:
  PGYER_API_KEY: 'your api key'
```

Check out the [Publishers](/publishers/appcenter) documentation for all possible publishers and how to configure them.

### Configure Release Items

The following example shows how to add a release that contains package `apk`, `ipa` and publish to `pgyer.com`, A `release` can include multiple jobs.

> The `build_args` are the args supported by the `flutter build` command, please modify it according to your project.

```yaml
releases:
  - name: dev
    jobs:
      # Build and publish your apk pkg to pgyer
      - name: release-dev-android
        package:
          platform: android
          target: apk
          build_args:
            flavor: dev
            target-platform: android-arm,android-arm64
            dart-define:
              APP_ENV: dev
        publish_to: pgyer
      # Build and publish your ipa pkg to pgyer
      - name: release-dev-ios
        package:
          platform: ios
          target: ipa
          build_args:
            flavor: dev
            export-options-plist: ios/dev_ExportOptions.plist
            dart-define:
              APP_ENV: dev
        publish_to: pgyer
```

### Full Example Configuration

```yaml
variables:
  PGYER_API_KEY: 'your api key'
output: dist/
releases:
  - name: dev
    jobs:
      # Build and publish your apk pkg to pgyer
      - name: release-dev-android
        package:
          platform: android
          target: apk
          build_args:
            flavor: dev
            target-platform: android-arm,android-arm64
            dart-define:
              APP_ENV: dev
        publish_to: pgyer
      # Build and publish your ipa pkg to pgyer
      - name: release-dev-ios
        package:
          platform: ios
          target: ipa
          build_args:
            flavor: dev
            export-options-plist: ios/dev_ExportOptions.plist
            dart-define:
              APP_ENV: dev
        publish_to: pgyer
```

### Release Your App

```
fastforge release --name dev
```

## Examples

Fastforge includes several example projects to help you get started:

- **[hello_world](https://github.com/fastforgedev/fastforge/tree/main/examples/hello_world)** - Basic example demonstrating the core functionality.
- **[multiple_flavors](https://github.com/fastforgedev/fastforge/tree/main/examples/multiple_flavors)** - Example showing how to configure multiple application flavors.
- **[custom_binary_name](https://github.com/fastforgedev/fastforge/tree/main/examples/custom_binary_name)** - Example of how to customize binary output names.

## Advanced Usage

### Environment Variables

Fastforge supports using environment variables in your configuration files. This is useful for sensitive information like API keys:

```yaml
variables:
  API_KEY: ${PGYER_API_KEY}  # Uses the PGYER_API_KEY environment variable
```

### CI/CD Integration

Fastforge works well in CI/CD environments. For example, with GitHub Actions:

```yaml
jobs:
  build-and-release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - name: Install Fastforge
        run: dart pub global activate fastforge
      - name: Build and release
        run: fastforge release --name production
        env:
          API_KEY: ${{ secrets.API_KEY }}
```

Check the [documentation](https://fastforge.dev/) for more detailed CI/CD integration examples.

## Thank You

🎉 🎉 🎉
