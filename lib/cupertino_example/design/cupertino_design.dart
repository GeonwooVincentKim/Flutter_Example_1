import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                child: CupertinoPicker(
                                  itemExtent: 50,
                                  backgroundColor: Colors.white,
                                  scrollController: firstController,
                                  onSelectedItemChanged: (index) {},
                                  children: List<Widget>.generate(10, (index) {
                                    return Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text((++index).toString())
                                      )
                                    );
                                  }),
                                )
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel')
                              )
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
