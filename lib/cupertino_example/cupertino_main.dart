import 'package:flutter/cupertino.dart';

class CupertinoMain extends StatefulWidget {
  const CupertinoMain({super.key});

  @override
  State<CupertinoMain> createState() => _CupertinoMainState();
}

class _CupertinoMainState extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = CupertinoTabBar(
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
        const BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar!,
        tabBuilder: (context, value) {
          if (value == 0) {
            return Center(
              child: Text('Cupertino Tab 1'),
            );
          } else {
            return Center(
              child: Text('Cupertino Tab 2')
            );
          }
        },
      ),
    );
  }
}