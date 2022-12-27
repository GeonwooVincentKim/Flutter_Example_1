import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/navigation/app_screens/first_page.dart';
import 'package:flutter_application_1_1/navigation/app_screens/second_page.dart';

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
        "/": (context) => const FirstPage(),
        "/second": (context) => const SecondPage()
      }
    );
  }
}

