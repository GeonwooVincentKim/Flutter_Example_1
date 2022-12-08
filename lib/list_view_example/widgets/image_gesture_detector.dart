import 'package:flutter/material.dart';

class ImageGestureDetectore extends StatelessWidget {
  final int width;
  final String imagePath;

  const ImageGestureDetectore(
      {super.key, required this.width, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(imagePath, width: 80),
      onTap: () => imagePath,
    );
  }
}
