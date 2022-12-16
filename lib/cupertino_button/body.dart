import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/cupertino_chat.dart';
import 'package:flutter_application_1_1/cupertino_button/cupertino_settings.dart';

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

        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Calls')
                ),
                child: Center(child: Text('Calls'))
              );
            });
            break;
          
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Chat')
                  ),
                  child: Center(child: Text('Chat'))
                );
                // return CupertinoNavigationPage(middleWidget: Text(""));
              },
            );
            break;
          
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Settings')
                  ),
                  child: Center(child: Text('Settings'))
                );
                // return CupertinoNavigationPage(middleWidget: Text(""));
              },
            );
            break;
        }

        return returnValue;
      },
    );
  }
}

// class CupertinoNavigationPage extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final Widget middleWidget;

//   const CupertinoNavigationPage({
//     super.key,
//     required this.middleWidget
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         // middle: middleWidget
//         // middle: Text('Calls')
//         // middle: Widget(key: key, middleWidget),
//       ),
//       child: Center(child: Text('Calls'))
//     );
//   }
// }