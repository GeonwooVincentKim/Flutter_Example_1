import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/model/users.dart';
import 'package:flutter_application_1_1/cupertino_button/widgets/user_tile.dart';

class CupertinoSliverGrid extends StatelessWidget {
  final List<User> userList;
  const CupertinoSliverGrid({
    super.key,
    required this.userList
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return UserTile(user: userList[index]);
        },
        childCount: userList.length,
      ),
    );
  }
}
