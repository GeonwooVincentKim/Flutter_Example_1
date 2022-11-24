import 'package:flutter/material.dart';

import 'animal.dart';

class FirstApp extends StatelessWidget {
  final List<Animal>? list;

  const FirstApp({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(itemBuilder: (context, position) {
// 여기서 context가 나오는데 build할 위치를 찾아갑니다. 여기서는 scaffold 위에 있는 context를 찾아서
// scaffold 위에 ListView를 그려 줍니다.
// position은 list에서 아이템의 위치 또는 순서를 나타냅니다. 
// 그래서 이미지와 텍스트의 짝을 맞춰서 list를 만듭니다.
            return Card(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    list![position].imagePath!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  Text(list![position].animalName!)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}