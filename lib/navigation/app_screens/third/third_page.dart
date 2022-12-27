import 'package:flutter/material.dart';

class ThirdDetail extends StatelessWidget {
  const ThirdDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page')
      ),
      body: Container(
        child: Center(
          child: Text(
            args,
            style: const TextStyle(fontSize: 30)
          )
          // child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: const Text('Access to First Page')
          // )
        )
      )
    );
  }
}
