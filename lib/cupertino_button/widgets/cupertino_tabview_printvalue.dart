import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/app_screens/cupertino_chat.dart';
import 'package:flutter_application_1_1/cupertino_button/model/users.dart';

class PrintValue extends StatelessWidget {
  final dynamic textLocation;
  final List<User> userList;

  const PrintValue({
    super.key,
    required this.textLocation,
    required this.userList
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text(textLocation),
              leading: const Text(
                'Edit',
                style: TextStyle(color: CupertinoColors.link),
              ),
              middle: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CupertinoActivityIndicator(),
                  SizedBox(width: 8),
                  Text('Waiting for Network')
                ],
              )
            ),
            CupertinoChatPage(userList: userList),
          ],
        );
      },
    );
  }
}