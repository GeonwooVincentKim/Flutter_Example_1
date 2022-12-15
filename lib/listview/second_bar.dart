import 'package:flutter/material.dart';

import 'animal.dart';

class SecondApp extends StatefulWidget {
  const SecondApp({Key? key}) : super(key: key);

  get list => null;

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int? _radioValue = 0;
  bool? flyExist = false;
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLength: 1,
              ),
              Row(
                children: [
                  Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('Amphibian'),
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('Reptile'),
                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('Mammal'),
                ],
              ),
              Row(
                children: [
                  Text('Can fly?'),
                  Checkbox(
                      value: flyExist,
                      onChanged: (bool? check1234) {
                        setState(() {
                          flyExist = check1234;
                        });
                      })
                ],
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      child: Image.asset('image/chapter_06/cow.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/pig.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/bee.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/cat.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/dog.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/dog.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/fox.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/monkey.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/monkey.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('image/chapter_06/wolf.png',
                          height: 50, width: 80),
                      onTap: () {
                        _imagePath = 'image/chapter_06/wolf.png';
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Animal'),
                onPressed: () {
                  var animal = Animal(
                      animalName: nameController.value.text,
                      kind: getKind(_radioValue!),
                      imagePath: _imagePath,
                      flyExist: flyExist);

                  AlertDialog dialog = AlertDialog(
                    title: Text('Add Animal'),
                    content: Text(
                      'This is ${animal.animalName}.' +
                          'The Kind is ${animal.kind}\n' +
                          'Do you want to add this animal?',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          widget.list?.add(animal);
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
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
