import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';
import 'package:flutter_application_1_1/list_view_example/provider/animal_provider.dart';
import 'package:flutter_application_1_1/list_view_example/screen/cupertino_first_page.dart';
import 'package:flutter_application_1_1/list_view_example/screen/cupertino_second_page.dart';

List<Animal> favoriteList = List.empty(growable: true);

class CupertinoMain extends StatefulWidget {
  const CupertinoMain({super.key});

  @override
  State<CupertinoMain> createState() => _CupertinoMainState();
}

class _CupertinoMainState extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    tabBar = CupertinoTabBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          const BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
        ]);

    animalList = AnimalProvider().animalItems;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar!,
        tabBuilder: (context, value) {
          if (value == 0) {
            return CupertinoFirstPage(
              animalList: animalList,
            );
          } else {
            return CupertinoSecondPage(animalList: animalList);
          }
        },
      ),
    );
  }
}
