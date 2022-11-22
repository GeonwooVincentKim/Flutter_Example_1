import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Example')),
      body: Container(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(keyboardType: TextInputType.number, controller: value1)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value2,),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.add),
                      const Text('더하기')
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)
                  ),
                  onPressed: () {
                    setState(() {
                      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                      sum = '$result';
                    });
                  }
                )  
              )
            ],
          ),
        )
      )
    );
  }

}