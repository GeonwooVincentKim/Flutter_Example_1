import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {
  const SecondDetail({super.key});

  @override
  State<SecondDetail> createState() => _SecondDetailState();
}

class _SecondDetailState extends State<SecondDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page')
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/second');
            },
            child: const Text('Access to First Page')
          )
        )
      )
    );
  }
}
