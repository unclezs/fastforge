# fastforge

[![pub version][pub-image]][pub-url] [![][discord-image]][discord-url] [![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos) [![All Contributors][all-contributors-image]](#contributors)

[pub-image]: https://img.shields.io/pub/v/fastforge.svg?style=flat-square
[pub-url]: https://pub.dev/packages/fastforge
[discord-image]: https://img.shields.io/discord/884679008049037342.svg?style=flat-square
[discord-url]: https://discord.gg/zPa6EZ2jqb
[all-contributors-image]: https://img.shields.io/github/all-contributors/fastforgedev/fastforge?color=ee8449&style=flat-square

An all-in-one [Flutter](https://flutter.dev) application packaging and distribution tool, providing you with a one-stop solution to meet various distribution needs.

> **Name Change Notice:** ~~Flutter Distributor~~ has been renamed to FastForge. If you were previously using ~~Flutter Distributor~~, please note that all functionality remains the same, but the package name, commands, and documentation have been updated to reflect this change.

---

English | [简体中文](./README-ZH.md)

---

## Documentation

The full documentation can be found on [fastforge.dev](https://fastforge.dev/).

## Features

- **Comprehensive Package Format Support** - Generate platform-specific distribution files including APK, IPA, and desktop installation packages with ease.
- **Seamless Distribution Platform Integration** - Publish directly to major app marketplaces including the Google Play Store and Apple App Store, streamlining your release workflow.
- **Flexible Configuration Options** - Customize your packaging and publishing process through intuitive yet powerful configuration settings.
- **Future-Proof Updates** - Continuously maintained to ensure compatibility with the latest Flutter framework and platform requirements.

### Supported Package Formats

- **Android**: [AAB](https://fastforge.dev/en/makers/aab), [APK](https://fastforge.dev/en/makers/apk)
- **iOS**: [IPA](https://fastforge.dev/en/makers/ipa)
- **Linux**: [AppImage](https://fastforge.dev/en/makers/appimage), [DEB](https://fastforge.dev/en/makers/deb), [RPM](https://fastforge.dev/en/makers/rpm), Pacman
- **macOS**: [DMG](https://fastforge.dev/en/makers/dmg), [PKG](https://fastforge.dev/en/makers/pkg)
- **Windows**: [EXE](https://fastforge.dev/en/makers/exe), [MSIX](https://fastforge.dev/en/makers/msix)
- **Universal**: [ZIP](https://fastforge.dev/en/makers/zip)
- More format support coming soon...

### Supported Distribution Platforms

- [App Center](https://fastforge.dev/en/publishers/appcenter)
- [App Store](https://fastforge.dev/en/publishers/appstore)
- [Firebase](https://fastforge.dev/en/publishers/firebase)
- [Firebase Hosting](https://fastforge.dev/en/publishers/firebase-hosting)
- [FIR](https://fastforge.dev/en/publishers/fir)
- [GitHub Releases](https://fastforge.dev/en/publishers/github)
- [PGYER](https://fastforge.dev/en/publishers/pgyer)
- [Play Store](https://fastforge.dev/en/publishers/playstore)
- [Qiniu](https://fastforge.dev/en/publishers/qiniu)
- [Vercel](https://fastforge.dev/en/publishers/vercel)
- More platform support coming soon...

## Installation

```bash
dart pub global activate fastforge
```

## Quick Start

1. Add `distribute_options.yaml` to your project root:

```yaml
variables:
  PGYER_API_KEY: "your api key" # Replace with your own API keys
output: dist/
releases:
  - name: dev
    jobs:
      # Build and publish APK to PGYER
      - name: release-dev-android
        package:
          platform: android
          target: apk
          build_args:
            target-platform: android-arm,android-arm64
            dart-define:
              APP_ENV: dev
        publish_to: pgyer

      # Build and publish IPA to PGYER
      - name: release-dev-ios
        package:
          platform: ios
          target: ipa
          build_args:
            export-options-plist: ios/dev_ExportOptions.plist
            dart-define:
              APP_ENV: dev
        publish_to: pgyer
```

> The `build_args` are the args supported by the `flutter build` command, please modify it according to your project.

2. Release your app:

```bash
fastforge release --name dev
```

## CLI Commands

### Package Your App

```bash
fastforge package --platform=android --targets=aab,apk
```

### Publish a Package

```bash
fastforge publish --path dist/your-app-1.0.0+1-android.apk --targets pgyer
```

### Release (Package + Publish)

```bash
fastforge release --name dev
```

## Who's using it?

- [Biyi](https://biyidev.com/) - A convenient translation and dictionary app.
- [Qianji](https://qianjiapp.com/) - A purely bookkeeping app.
- [Airclap](https://airclap.app/) - Send any file to any device. cross platform, ultra fast and easy to use.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/lijy91"><img src="https://avatars.githubusercontent.com/u/3889523?v=4?s=100" width="100px;" alt="LiJianying"/><br /><sub><b>LiJianying</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=lijy91" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://juejin.cn/user/764915820276439"><img src="https://avatars.githubusercontent.com/u/8764899?v=4?s=100" width="100px;" alt="Zero"/><br /><sub><b>Zero</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=BytesZero" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/KRTirtho"><img src="https://avatars.githubusercontent.com/u/61944859?v=4?s=100" width="100px;" alt="Kingkor Roy Tirtho"/><br /><sub><b>Kingkor Roy Tirtho</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=KRTirtho" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/laiiihz"><img src="https://avatars.githubusercontent.com/u/35956195?v=4?s=100" width="100px;" alt="LAIIIHZ"/><br /><sub><b>LAIIIHZ</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=laiiihz" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ueki-tomohiro"><img src="https://avatars.githubusercontent.com/u/27331430?v=4?s=100" width="100px;" alt="Tomohiro Ueki"/><br /><sub><b>Tomohiro Ueki</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=ueki-tomohiro" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://cybrox.eu/"><img src="https://avatars.githubusercontent.com/u/2383736?v=4?s=100" width="100px;" alt="Sven Gehring"/><br /><sub><b>Sven Gehring</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=cybrox" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/GargantuaX"><img src="https://avatars.githubusercontent.com/u/14013111?v=4?s=100" width="100px;" alt="GargantuaX"/><br /><sub><b>GargantuaX</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=GargantuaX" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/hiperioncn"><img src="https://avatars.githubusercontent.com/u/6045710?v=4?s=100" width="100px;" alt="Hiperion"/><br /><sub><b>Hiperion</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=hiperioncn" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/GroovinChip"><img src="https://avatars.githubusercontent.com/u/4250470?v=4?s=100" width="100px;" alt="Reuben Turner"/><br /><sub><b>Reuben Turner</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=GroovinChip" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://animator.github.io"><img src="https://avatars.githubusercontent.com/u/615622?v=4?s=100" width="100px;" alt="Ankit Mahato"/><br /><sub><b>Ankit Mahato</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=animator" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://tienisto.com"><img src="https://avatars.githubusercontent.com/u/38380847?v=4?s=100" width="100px;" alt="Tien Do Nam"/><br /><sub><b>Tien Do Nam</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=Tienisto" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://zacksleo.top/"><img src="https://avatars.githubusercontent.com/u/3369169?v=4?s=100" width="100px;" alt="zacks"/><br /><sub><b>zacks</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=zacksleo" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/M97Chahboun"><img src="https://avatars.githubusercontent.com/u/69054810?v=4?s=100" width="100px;" alt="Mohammed  CHAHBOUN"/><br /><sub><b>Mohammed  CHAHBOUN</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=M97Chahboun" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/prateekmedia"><img src="https://avatars.githubusercontent.com/u/41370460?v=4?s=100" width="100px;" alt="Prateek Sunal"/><br /><sub><b>Prateek Sunal</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=prateekmedia" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/LailaiMaster"><img src="https://avatars.githubusercontent.com/u/19606597?v=4?s=100" width="100px;" alt="lllgm"/><br /><sub><b>lllgm</b></sub></a><br /><a href="https://github.com/fastforgedev/fastforge/commits?author=LailaiMaster" title="Code">💻</a></td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td align="center" size="13px" colspan="7">
        <img src="https://raw.githubusercontent.com/all-contributors/all-contributors-cli/1b8533af435da9854653492b1327a23a4dbd0a10/assets/logo-small.svg">
          <a href="https://all-contributors.js.org/docs/en/bot/usage">Add your contributions</a>
        </img>
      </td>
    </tr>
  </tfoot>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

## License

[MIT](./LICENSE)
