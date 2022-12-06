import 'package:flutter/material.dart';

class Animal {
  String imagePath;
  String animalName;
  String kind;
  bool? flyExist = false;
  // bool? flyExist;

  Animal({
    required this.imagePath,
    required this.animalName,
    required this.kind,
    this.flyExist
  });


  // Factory Function to get Single JSON Data from DB
  factory Animal.from(Animal animal) {
    return Animal(
      imagePath: animal.imagePath,
      animalName: animal.animalName,
      kind: animal.kind,
      flyExist: animal.flyExist
    );
  }
  
  // To Initialize Data
  factory Animal.initialData() {
    return Animal(
      imagePath: '',
      animalName: '',
      kind: '',
      flyExist: false
    );
  }
}
