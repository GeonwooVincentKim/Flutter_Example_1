import 'package:flutter/material.dart';

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
        "/": (context) => FirstPage(),
        "/second": (context) => SecondPage()
      }
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  
  @override
  State<StatefulWidget> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sub Page Main')),
      body: Container(
        child: Center(
          child: Text('First Page')
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
          Navigator.of(context).pushNamed("/second");
        },
        child: Icon(Icons.add),
      ),
    );
  } 
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  
  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sub Page Second')),
      body: Container(
        child: Center(
          child: Text('Second Page')
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  } 
}
