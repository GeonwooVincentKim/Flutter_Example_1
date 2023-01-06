import 'package:flutter/material.dart';

class PaddingTextField extends StatelessWidget {
  final TextEditingController? titleController;
  final String labelText;

  const PaddingTextField({
    super.key,
    required this.titleController,
    required this.labelText,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: titleController,
        decoration: InputDecoration(labelText: labelText),
      )
    );
  }
}