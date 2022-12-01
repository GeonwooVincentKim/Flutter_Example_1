import 'package:flutter/material.dart';

void main() {
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

