import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/cupertino_example/design/widget/custom_cupertino_picker.dart';
import 'package:flutter_application_1_1/cupertino_example/design/widget/custom_text_button.dart';

void main() => runApp(const CupertinoDesignPage());

class CupertinoDesignPage extends StatefulWidget {
  const CupertinoDesignPage({super.key});

  @override
  State<CupertinoDesignPage> createState() => _CupertinoDesignPageState();
}

class _CupertinoDesignPageState extends State<CupertinoDesignPage> {
  FixedExtentScrollController? firstController;

  @override
  void initState() {
    super.initState();
    firstController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              // ignore: sort_child_properties_last
              children: [
                CupertinoButton(
                  child: const Text('PICKER'),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context, 
                      builder: (context) {
                        return Container(
                          height: 400,
                          child: Column(
                            children: [
                              Expanded(
                                child: CustomCupertinoPicker(firstController: firstController)
                              ),
                              const CustomTextButton(text: "Cancel"),
                            ],
                          )
                        );
                      }
                    );
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,  
            ),
          )
        )
      ),
    );
  }
}
