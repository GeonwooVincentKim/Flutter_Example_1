import 'package:flutter/material.dart';
// import 'package:flutter_application_1_1/shared_preference/app_screens/file_app.dart';
import 'package:flutter_application_1_1/shared_preference/app_screens/intro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IntroPage()
      // home: const MyHomePage(title: 'internal_example'),
    );
  }
}
