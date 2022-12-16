import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Chat App'),
      ),
      child: Center(
        child: Text('Hi')
      )
    );
  }
}
