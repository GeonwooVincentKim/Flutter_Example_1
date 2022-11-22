import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {
  const MaterialFlutterApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return MaterialFlutterAppState();
  }
}

class MaterialFlutterAppState extends State<MaterialFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Design App')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {

        }
      ),
      body: Container(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables, sort_child_properties_last
            children: <Widget>[
              const Icon(Icons.android), 
              const Text('android')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        )
      )
    );
  }
}
