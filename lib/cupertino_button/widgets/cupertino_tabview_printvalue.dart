import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/app_screens/cupertino_chat.dart';
import 'package:flutter_application_1_1/cupertino_button/model/users.dart';
import 'package:flutter_application_1_1/cupertino_button/widgets/cupertino_scroll_view/cupertino_sliver_navi_bar.dart';

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
            CupertinoSliverNaviBar(textLocation: textLocation),
            CupertinoChatPage(userList: userList),
          ],
        );
      },
    );
  }
}
