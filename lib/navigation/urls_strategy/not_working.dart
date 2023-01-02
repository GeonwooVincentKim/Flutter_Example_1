import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class ExampleApp extends StatelessWidget {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Sharp Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('URL Sharp Example'),
        ),
      ),
    );
  }
}

