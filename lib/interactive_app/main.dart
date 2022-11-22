import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp()
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});
  
  @override
  WidgetAppState createState() => WidgetAppState();
}

class WidgetAppState extends State<WidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Example')),
      body: Container(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Flutter')
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(child: const Text(''), onPressed: () {})  
              )
            ],
          ),
        )
      )
    );
  }

}