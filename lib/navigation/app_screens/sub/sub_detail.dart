import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/navigation/model/todo.dart';
import 'package:flutter_application_1_1/navigation/providers/todo_provider.dart';

class SubDetail extends StatefulWidget {
  const SubDetail({super.key});

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<Todo> getTodoList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    getTodoList = TodoProvider().todoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Detail Example')
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            child: Text(getTodoList[index].toString(), style: const TextStyle(fontSize: 30)),
            onTap:() {
              Navigator.of(context).pushNamed('/thrid', arguments: getTodoList[index].toString());
            }
          )
        );
      }, itemCount: getTodoList.length),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _addNavigation(context);
      }, child: const Icon(Icons.add)),
    );
  }

  void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      getTodoList.add(result as Todo);
      // getTodoList.add(result as String);
    });
  }
}
