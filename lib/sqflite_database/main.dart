import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/sqflite_database/app_screens/database_app.dart';
// import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<Database> initDatabase() async {
  //   return openDatabase(
  //     join(await getDatabasesPath(), 'todo_database.db'),
  //     onCreate: (db, version) {
  //       return db.execute(
  //         "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, "
  //         "title TEXT, context TEXT, active INTEGER)",
  //       );
  //     }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatabaseApp(),
    );
  }
}
