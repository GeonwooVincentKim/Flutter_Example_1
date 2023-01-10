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
    todoList = getTodos();
  }
  
  void _insertTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.insert(
      'todos', todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    setState(() {
      todoList = getTodos();
    });
  }

  Future<List<Todo>> getTodos() async {
    final Database database = await widget.db;
    final List<Map<String, dynamic>> maps = await database.query('todos');

    return List.generate(maps.length, (i) {
      int active = maps[i]['active'] == 1 ? 1 : 0;
      return Todo(
        title: maps[i]['title'].toString(),
        content: maps[i]['content'].toString(),
        active: active,
        id: maps[i]['id']
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Database Example')),
      body: Container(
        child: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:  return CircularProgressIndicator();
                case ConnectionState.waiting:   return CircularProgressIndicator();
                case ConnectionState.active:  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        Todo todo = (snapshot.data as List<Todo>)[index];

                        return ListTile(
                          title: Text(
                            todo.title!,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Column(
                            children: [
                              Text(todo.content!),
                              Text('Check: ${todo.active == 1 ? 'true': 'false'}'),
                              Container(
                                height: 1,
                                color: Colors.blue
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: (snapshot.data as List<Todo>).length,
                    );
                  }
                else {
                  return const Text('No Data');
                }
              }
              return CircularProgressIndicator();
            },
            future: todoList,
          )
        )
      ),
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
