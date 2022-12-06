import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/list_view_example/data/animal.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';

class AnimalProvider with ChangeNotifier {
  final List<Animal> _animalItems = DUMMY_ANIMAL.toList();
  List<Animal> get animalItems => [..._animalItems];
}
