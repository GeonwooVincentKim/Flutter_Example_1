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
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              CupertinoButton(
                child: Text('PICKER'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context, 
                    builder: (context) {
                      return Container();
                    }
                  );
                },
              ),
            ],
          )
        )
      )
    );
  }
}
