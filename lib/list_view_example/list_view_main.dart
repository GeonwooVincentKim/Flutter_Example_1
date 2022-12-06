import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';
import 'package:flutter_application_1_1/list_view_example/provider/animal_provider.dart';
import 'package:flutter_application_1_1/list_view_example/screen/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List View Example",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(key: key)
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    animalList = AnimalProvider().animalItems;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text("List View Example")),
        body: TabBarView(
          children: <Widget>[
            FirstApp(list: animalList),
            FirstApp(list: animalList),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Tab>[
            Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
            Tab(icon: Icon(Icons.looks_two, color: Colors.blue),)
          ],
          controller: controller,
        ),
      )
    );
    // return ;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
