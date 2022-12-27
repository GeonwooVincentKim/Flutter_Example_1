import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  const SubDetail({super.key});

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<String> todoList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Detail Example')
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            child: Text(todoList[index], style: const TextStyle(fontSize: 30)),
            onTap:() {
              Navigator.of(context).pushNamed('/thrid', arguments: todoList[index]);
            }
          )
        );
      })
    );
  }
}
