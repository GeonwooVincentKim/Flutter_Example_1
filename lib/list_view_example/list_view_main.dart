import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';
import 'package:flutter_application_1_1/list_view_example/provider/animal_provider.dart';
import 'package:flutter_application_1_1/list_view_example/screen/first_page.dart';
import 'package:flutter_application_1_1/list_view_example/screen/second_page.dart';
import 'package:flutter_application_1_1/list_view_example/widgets/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List View Example",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(key: key),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late StreamSubscription subscription;

  TabController? controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);

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
              SecondApp(list: animalList),
            ],
            controller: controller,
          ),
          bottomNavigationBar: TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.looks_one, color: Colors.blue),
              ),
              Tab(
                icon: Icon(Icons.looks_two, color: Colors.blue),
              )
            ],
            controller: controller,
          ),
        ));
  }

  @override
  void dispose() {
    subscription.cancel();
    controller?.dispose();
    super.dispose();
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
      ? 'You have again ${result.toString()}'
      : 'You have no internet';
    
    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnackBar(context, message, color);
  }
}
