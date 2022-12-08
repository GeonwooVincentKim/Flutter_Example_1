import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';

class SecondApp extends StatefulWidget {
  final List<Animal> list;
  const SecondApp({super.key, required this.list});

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  int _radioValue = 0;
  final nameController = TextEditingController();

  bool flyExist = false;
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            maxLines: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
            const Text('Amphibian'),
            Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
            const Text('Reptile'),
            Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
            const Text('Mammal')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Can fly?'),
            Checkbox(
                value: flyExist,
                onChanged: (bool? check) => setState(() => flyExist = check!))
          ],
        ),
      ],
    )));
  }

  void _radioChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }
}
