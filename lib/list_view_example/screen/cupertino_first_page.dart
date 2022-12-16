import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1_1/cupertino_example/cupertino_main.dart';
import 'package:flutter_application_1_1/list_view_example/model/animalItem.dart';

class CupertinoFirstPage extends StatelessWidget {
  final List<Animal> animalList;

  const CupertinoFirstPage({Key? key, required this.animalList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('동물 리스트'),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.all(5),
                height: 100,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          animalList[index].imagePath,
                          fit: BoxFit.contain,
                          width: 80,
                          height: 80,
                        ),
                        Text(animalList[index].animalName)
                      ],
                    ),
                    Container(
                      height: 2,
                      color: CupertinoColors.black,
                    )
                  ],
                ),
              ),
              onTap: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(animalList[index].animalName),
                      );
                    });
              },
              onLongPress: () {
                print('add fav');
                favoriteList.add(Animal(
                    animalName: animalList[index].animalName,
                    kind: animalList[index].kind,
                    imagePath: animalList[index].imagePath));
              },
            );
          },
          itemCount: animalList.length,
        ));
  }
}
