<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Display an app wide banner to indicate what flavor or version you app is.

## Features

- Can be shown on every screen (or specific with your routing)
- Customize the color
- Customize the message, with your applications flavor, version, or something else
- onTap can be used to show a dialog or other widgeets

## Getting started

Add to your `pubspec.yaml`

```yaml
dependencies:
  flavor_banner:
    git:
      url: https://github.com/hamishnorton/flavor_banner.git
```

## Usage

```dart
import 'package:flavor_banner/flavor_banner.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Flavor Banner Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: appTitle),
      builder: (context, child) {
        return FlavorBanner(
          color: Colors.blue[900],
          message: 'Test',
          onTapShow: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
          ),
          showBanner: kDebugMode,
          child: child ?? Container(),
        );
      },
    );
  }
}
```
