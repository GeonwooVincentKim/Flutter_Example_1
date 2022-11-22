import 'package:flutter/material.dart';


class ImageWidgetApp extends StatefulWidget {
  const ImageWidgetApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return ImageWidgetAppState();
  }
}

class ImageWidgetAppState extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Widget')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('image/sample_image.png', width: 200, height: 100, fit: BoxFit.fill),
              // ignore: prefer_const_constructors
              Text('Hello Flutter',
                style: const TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Colors.blue
                )
              )
            ],
          )
        )
      )
    );
  }
}
