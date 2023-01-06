import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/sqflite_database/model/todo.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseApp extends StatefulWidget {
  final Future<Database> db;
  const DatabaseApp({required this.db, super.key});

  @override
  State<DatabaseApp> createState() => _DatabaseAppState();
}

class _DatabaseAppState extends State<DatabaseApp> {
  Future<List<Todo>>? todoList;

  @override
  void initState() {
    super.initState();
    // todoList = getTodos();
  }
  
  void _insertTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.insert(
      'todos', todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    // setState(() {
    //   todoList = getTodos();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Database Example')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todo = await Navigator.of(context).pushNamed('/add');

          if (todo != null) {
            _insertTodo(todo as Todo);
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
