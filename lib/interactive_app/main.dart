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
            children: [
              Text('Flutter'),
              TextField(),
              ElevatedButton(onPressed: () {}, child: const Text(''))
            ],
          ),
        )
      )
    );
  }

}