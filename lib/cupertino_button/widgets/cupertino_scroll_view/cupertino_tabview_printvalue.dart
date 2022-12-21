import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/app_screens/cupertino_chat.dart';
import 'package:flutter_application_1_1/cupertino_button/app_screens/cupertino_settings.dart';
import 'package:flutter_application_1_1/cupertino_button/model/users.dart';

class PrintValue extends StatelessWidget {
  final dynamic textLocation;
  final List<User> userList;
  final int index;

  const PrintValue({
    super.key,
    required this.textLocation,
    required this.userList,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        if (index == 0) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(textLocation)
            ),
            child: Center(
              child: Text(textLocation),
            ),
          );
        } else if (index == 1) {
          return CupertinoChat(userList: userList, textLocation: textLocation);
        } else {
          return CupertinoSettingsPage();
        }
        // if (index == 0) {
        //   return CustomScrollView(
        //     slivers: [
        //       CupertinoSliverNaviBar(textLocation: textLocation),
        //     ],
        //   );
        // } else if (index == 1) {
        //   return CupertinoChatPage(userList: userList);
        // } else if (index == 2) {
        //   return CupertinoSettingsPage();
        // } else {
        //   return CustomScrollView(
        //     slivers: [
        //       CupertinoSliverNaviBar(textLocation: textLocation),
        //     ],
        //   );          
        // }
        // if (index == 0) {
        //   return CupertinoSettingsPage();
        // } else if (index == 1) {
        //   return CupertinoChatPage(userList: userList);
        // } else {
          // return CustomScrollView(
            // index == 0 ? (slivers: [

            // ])
            // slivers: [
            // ],
            // if (index == 0) {
            //   slivers: [

            //     CupertinoSliverNaviBar(textLocation: textLocation,),
            //     CupertinoChatPage(userList: userList)
            //   ],
            // }
          // );
        // }
        // if (index == 0) {
        //   return CustomScrollView(
        //     slivers: [
        //       CupertinoChatPage(userList: userList)
        //     ]
        //   );
        // } else {
        //   return const CustomScrollView(
        //     slivers: [
        //       CupertinoSettingsPage(),
        //     ],
        //   );
        // }
        // return CupertinoChatPage(userList: userList);
      },
    );
  }

  // Widget checkIndex (index) {
  //   if (index == 0) return CupertinoChatPage(userList: userList);
  //   else if (index == 1) return CupertinoChatPage(userList: userList);
  //   else if (index == 2) return CupertinoSettingsPage();
  //   else return CupertinoSettingsPage();
  // }
}
