import 'package:flutter/material.dart';

class TransparentDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.transparent,
      height: 40,
    );
  } 
}

class CustomDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  CustomDivider({
    required this.color,
    this.height = 30,
    this.width = 10
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height
    );
  }
}