import 'package:flavor_banner/flavor_banner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Tap the banner in the top left.',
            ),
          ],
        ),
      ),
    );
  }
}
