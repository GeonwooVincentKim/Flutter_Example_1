import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/sqflite_database/model/todo.dart';
import 'package:flutter_application_1_1/sqflite_database/widgets/navigator_pop_text_button.dart';
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

  void _allUpdate() async {
    final Database database = await widget.db;
    await database.rawUpdate('update todos set active = 1 where active = 0');

    setState(() {
      todoList = getTodos();
    });
  }

  void _updateTodo(Todo todo) async {
    final Database database = await widget.db;
    
    await database.update(
      'todos',
      todo.toMap(),
      where: 'id = ? ',
      whereArgs: [todo.id]
    );

    setState(() {
      todoList = getTodos();
    });
  }

  void _deleteTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.delete('todos', where: 'id=?', whereArgs: [todo.id]);

    setState(() {
      todoList = getTodos();
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
                case ConnectionState.none: return CircularProgressIndicator();
                case ConnectionState.waiting: return CircularProgressIndicator();
                case ConnectionState.active: return CircularProgressIndicator();
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
                          onTap: () async {
                            TextEditingController controller = new TextEditingController(text: todo.content);

                            Todo result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${todo.id} : ${todo.title}'),
                                  content: TextField(
                                    controller: controller,
                                    keyboardType: TextInputType.text
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          todo.active == 1
                                            ? todo.active == 0
                                            : todo.active == 1;
                                          todo.content = controller.value.text;
                                        });
                                        Navigator.of(context).pop(todo);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(todo);
                                      },
                                      child: const Text('No'),
                                    ),
                                  ],
                                );
                              }
                            );
                            _updateTodo(result);
                          },
                          onLongPress: () async {
                            Todo result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${todo.id} : ${todo.title}'),
                                  content: Text('Do you want to delete ${todo.content}?'),
                                  actions: [
                                    NavigatorPopTextButton(todo: todo, innerText: 'Yes'),
                                    NavigatorPopTextButton(todo: todo, innerText: 'No')
                                  ],
                                );
                              }
                            );
                            _deleteTodo(result);
                          },
                        );
                      },
                      itemCount: (snapshot.data as List<Todo>).length,
                    );
                  } else {
                  return const Text('No Data');
                }
              }
              return CircularProgressIndicator();
            },
            future: todoList,
          )
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final todo = await Navigator.of(context).pushNamed('/add');

              if (todo != null) {
                _insertTodo(todo as Todo);
              }
            },
            heroTag: null,
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 10
          ),
          FloatingActionButton(
            onPressed: () async {
              _allUpdate();
            },
            heroTag: null,
            child: Icon(Icons.update),
          )
        ],
      ) 
        

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
