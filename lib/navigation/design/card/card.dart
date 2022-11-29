import 'package:flutter/material.dart';

class SubPageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/");
      }
    );
  }
}