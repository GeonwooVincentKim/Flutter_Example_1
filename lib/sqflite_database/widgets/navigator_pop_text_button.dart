import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/sqflite_database/model/todo.dart';

class NavigatorPopTextButton extends StatelessWidget {
  final Todo todo;
  final String innerText;
  const NavigatorPopTextButton({super.key, required this.todo, required this.innerText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(todo);
      },
      child: Text(innerText),
    );
  }
}
