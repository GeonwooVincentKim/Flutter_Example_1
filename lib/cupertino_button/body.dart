import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/model/users.dart';
import 'package:flutter_application_1_1/cupertino_button/provider/user_provider.dart';
import 'package:flutter_application_1_1/cupertino_button/app_screens/cupertino_settings.dart';
import 'package:flutter_application_1_1/cupertino_button/widgets/cupertino_scroll_view/cupertino_tabview_printvalue.dart';
// import 'package:flutter_application_1_1/cupertino_button/widgets/cupertino_navigation_widget.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<User> userList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    userList = UserProvider().filteredUsers;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            currentIndex: 1,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), label: 'Calls'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
            ]),
        tabBuilder: (context, index) {
          List<String> getTitleText = ['Calls', 'Chats', 'Settings'];

          switch (index) {
            case 0: return PrintValue(textLocation: getTitleText[0], userList: userList, index: 0);
            case 1: return PrintValue(textLocation: getTitleText[1], userList: userList, index: 1);
            // case 2:  return PrintValue(textLocation: getTitleText[2], userList: userList, index: 2);
            case 2: return CupertinoSettingsPage(textLocation: Text(getTitleText[2].toString()));
          }

          return PrintValue(textLocation: getTitleText[0], userList: userList, index: 0);
        });
  }

  // CupertinoTabView printValue (textLocation) {
  //   return CupertinoTabView(
  //     builder: (context) {
  //       return CustomScrollView(
  //         slivers: [
  //           CupertinoSliverNavigationBar(
  //             largeTitle: Text(textLocation),
  //             leading: const Text(
  //               'Edit',
  //               style: TextStyle(color: CupertinoColors.link),
  //             ),
  //             middle: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: const [
  //                 CupertinoActivityIndicator(),
  //                 SizedBox(width: 8),
  //                 Text('Waiting for Network')
  //               ],
  //             )
  //           ),
  //           CupertinoChatPage(userList: userList),
  //         ],
  //       );
  //     },
  //   );
  // }
}
