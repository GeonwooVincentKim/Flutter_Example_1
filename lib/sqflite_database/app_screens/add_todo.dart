import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/sqflite_database/model/todo.dart';
import 'package:flutter_application_1_1/sqflite_database/widgets/padding_textfield.dart';

class AddTodoApp extends StatefulWidget {
  const AddTodoApp({super.key});

  @override
  State<AddTodoApp> createState() => _AddTodoAppState();
}

class _AddTodoAppState extends State<AddTodoApp> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              PaddingTextField(titleController: titleController, labelText: 'Title'),
              PaddingTextField(titleController: contentController, labelText: 'Todo'),
              ElevatedButton(
                onPressed: () {
                  Todo todo = Todo(
                    title: titleController!.value.text,
                    content: contentController!.value.text,
                    active: 0
                  );
                  Navigator.of(context).pop(todo);
                },
                child: const Text('Save')
              )
            ],
          )
        )
      )
    );
  }
}
