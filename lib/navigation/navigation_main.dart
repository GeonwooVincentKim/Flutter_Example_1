import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/navigation/app_screens/second/second_detail.dart';
import 'package:flutter_application_1_1/navigation/app_screens/sub/sub_detail.dart';
import 'package:flutter_application_1_1/navigation/app_screens/third/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SubPage Example",
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: FirstPage(),
      initialRoute: "/",
      routes: {
        // "/": (context) => const FirstPage(),
        // "/second": (context) => const SecondPage()
        "/": (context) => const SubDetail(),
        "/second": (context) => const SecondDetail(),
        "/third": (context) => const ThirdDetail()
      }
    );
  }
}

