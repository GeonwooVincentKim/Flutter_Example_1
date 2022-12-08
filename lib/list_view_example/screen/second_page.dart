import 'package:consumer/consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/list_view_example/data/animal.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';
import 'package:flutter_application_1_1/list_view_example/provider/animal_provider.dart';
import 'package:flutter_application_1_1/list_view_example/widgets/image_gesture_detector.dart';

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

  List<Animal> animalList = [];
  String animalImage = '';
  late Animal animal;

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
          Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const ImageGestureDetectore(
                      width: 80, imagePath: "image/chapter_06/cow.png"),
                  const ImageGestureDetectore(
                      width: 80, imagePath: "image/chapter_06/pig.png"),
                  const ImageGestureDetectore(
                      width: 80, imagePath: "image/chapter_06/bee.png"),
                  const ImageGestureDetectore(
                      width: 80, imagePath: "image/chapter_06/cat.png"),
                  const ImageGestureDetectore(
                      width: 80, imagePath: "image/chapter_06/dog.png"),
                ],
              )),
          ElevatedButton(
            child: const Text('Add Animal'),
            onPressed: () {
              var animal = Animal(
                  animalName: nameController.value.text,
                  kind: getKind(_radioValue),
                  imagePath: _imagePath,
                  flyExist: flyExist);

              AlertDialog dialog = AlertDialog(
                title: const Text('Add Animal'),
                content: Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  'This is ${animal.animalName}.' +
                      'The Kind is ${animal.kind}\n' +
                      'Do you want to add this animal?',
                  style: const TextStyle(fontSize: 30.0),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        widget.list.add(animal);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes')),
                  ElevatedButton(
                      onPressed: () {
                        widget.list.add(animal);
                        Navigator.of(context).pop();
                      },
                      child: const Text('No')),
                ],
              );
              showDialog(
                  context: context, builder: (BuildContext context) => dialog);
            },
          ),
        ],
      )),
    );
  }

  // void getImage(List<Animal> animalList, String image) {

  //   for (int i = 0; i < animalList.length; i++) {
  //     print(animalList[i]);

  //     return;
  //     // ImageGestureDetectore(width: 80, imagePath: "image/chapter_06/cow.png"),
  //   }
  // }

  // GestureDetector ImageGestureDetector() {

  // }

  _radioChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
}
