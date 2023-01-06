import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/sqflite_database/app_screens/add_todo.dart';
import 'package:flutter_application_1_1/sqflite_database/app_screens/database_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title TEXT, context TEXT, active INTEGER)",
        );
      },
      version: 1
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DatabaseApp(db: database),
        '/add': (context) => const AddTodoApp()
      },
    );
  }
}
