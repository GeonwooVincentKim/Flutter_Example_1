import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_button/data/users.dart';
import 'package:flutter_application_1_1/cupertino_button/model/users.dart';

class UserProvider with ChangeNotifier {
  final List<User> _filteredUsers = DUMMY_USERS.toList();
  List<User> get filteredUsers => [..._filteredUsers];
}
