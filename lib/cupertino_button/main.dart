import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/body.dart';
import 'package:flutter_application_1_1/cupertino_button/page_scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      // home: BodyPageScaffold(),
      home: Body(),
    );
  }
}
