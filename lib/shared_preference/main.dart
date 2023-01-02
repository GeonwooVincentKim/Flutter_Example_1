import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/shared_preference/app_screens/file_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FileApp()
      // home: const MyHomePage(title: 'internal_example'),
    );
  }
}
