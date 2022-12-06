import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> list;
  const FirstApp({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(list[position].imagePath, height: 100, width: 100, fit: BoxFit.contain,),
                      Text(list[position].animalName)
                    ],
                  )
                ),
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text('This is ${list[position].kind}.', style: const TextStyle(fontSize: 30.0),)
                  );
                  showDialog(context: context, builder: (BuildContext context) => dialog);
                },
                onLongPress: () {
                  list.removeAt(position);
                }
              );
            },
            itemCount: list.length
          ),
        )
      )
    );
  }
}