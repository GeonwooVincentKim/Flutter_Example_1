// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/tabbar/sub/firstPage.dart';
import 'package:flutter_application_1_1/tabbar/sub/secondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page')
    );
  }
}


class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState(); 
} 

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // controller.addListener(() {
    //   if(!controller.indexIsChanging){
    //     print("Preview index, ${controller.previousIndex}");
    //     print("Current index, ${controller.index}");
    //     print("Full tab length, ${controller.length}");        
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[FirstApp(), SecondApp()],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: TabBar(tabs: [
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue),) ,
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue),)
        ], controller: controller,
        )
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}