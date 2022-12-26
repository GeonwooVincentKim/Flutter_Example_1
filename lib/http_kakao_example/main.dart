import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/http_kakao_example/app_screens/http_app.dart';
import 'package:flutter_application_1_1/http_kakao_example/app_screens/largefile_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LargeFileMain()
      // home: HttpApp(),
    );
  }
}
