import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Sharp Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('URL Sharp Example'),
        ),
      ),
    );
  }
}
