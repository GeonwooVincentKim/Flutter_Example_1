import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/navigation/data/second_todolist.dart';
import 'package:flutter_application_1_1/navigation/model/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todoList = SUB_TODO.toList();
  List<Todo> get todoList => [..._todoList];
}
