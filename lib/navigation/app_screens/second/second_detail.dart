import 'package:flutter/material.dart';

class SecondDetail extends StatelessWidget {
  const SecondDetail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page')
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.value.text);
                  // Navigator.of(context).pushReplacementNamed('/second');
                },
                child: const Text('Save')
              )
            ]
          )
          // child: ElevatedButton(
          //   onPressed: () {
          //     // Navigator.of(context).pop(controller.value.text);
          //     Navigator.of(context).pushReplacementNamed('/third');
          //   },
          //   child: const Text('Access to Third Page')
          // )
        )
      )
    );
  }
}
