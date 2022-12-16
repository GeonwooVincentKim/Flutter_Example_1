import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/widget/cupertino_navigation_widget.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone), label: 'Calls'
          ),          
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: 'Settings'),
          ]
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        List<String> getTitleText = ['Calls', 'Chats', 'Settings'];

        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoNavigationWidget(
                  middleWidget: Text(getTitleText[0]), 
                  titleText: getTitleText[0]
                );
            });
            break;
          
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoNavigationWidget(
                  middleWidget: Text(getTitleText[1]), 
                  titleText: getTitleText[1]
                );
              },
            );
            break;
          
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoNavigationWidget(
                  middleWidget: Text(getTitleText[2]), 
                  titleText: getTitleText[2]
                );
              },
            );
            break;
        }

        return returnValue;
      },
    );
  }
}
