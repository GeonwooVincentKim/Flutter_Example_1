import 'package:flutter/material.dart';
import 'bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Starflix',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text("home"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("search"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("bookmark"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("list"),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Bottom(),
          ),
        ));
  }
}
