import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/cupertino_example/design/widget/custom_text_button.dart';

class CustomCupertinoPicker extends StatelessWidget {
  const CustomCupertinoPicker({
    super.key,
    required this.firstController,
  });

  final FixedExtentScrollController? firstController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50,
      backgroundColor: Colors.white,
      scrollController: firstController,
      onSelectedItemChanged: (index) {},
      children: List<Widget>.generate(10, (index) {
        return Center(
          child: CustomTextButton(text: (++index).toString())
        );
      }),
    );
  }
}
