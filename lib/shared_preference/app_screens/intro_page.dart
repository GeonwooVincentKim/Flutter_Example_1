import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/http_kakao_example/app_screens/largefile_main.dart';
import 'package:flutter_application_1_1/main.dart';
import 'package:path_provider/path_provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Widget logo = const Icon(Icons.info, size: 50);

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                    return const MyHomePage(title: '');
                  }));
                },
                child: const Text('Move to next'),
              )
            ]
          )
        )
      )
    );
  }

  void initData() async {
    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File("${dir.path}/myimage.jpg").exists();

    if (fileExist) {
      setState(() {
        logo = Image.file(
          File('${dir.path}/myimage.jpg'),
          height: 200,
          width: 200,
          fit: BoxFit.contain
        );
      });
    }

  }
}