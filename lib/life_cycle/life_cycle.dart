import 'package:flutter/material.dart';

void main () => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // ignore: avoid_print
    print("createState");
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var switchValue = false;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primaryColor: Colors.amber),
      darkTheme: ThemeData.light(),

      home: Scaffold(
        body: Center(
          child: Switch(value: switchValue, onChanged: (value) {
            setState((() {
              // ignore: avoid_print
              print(value);
              switchValue = value;
            }));
          })
        )
      )
    );
  }
}
