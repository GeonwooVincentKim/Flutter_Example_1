import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: WidgetApp()
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});
  
  @override
  WidgetAppState createState() => WidgetAppState();
}

class WidgetAppState extends State<WidgetApp> {
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  List _buttonList = ['Add', 'Minus', 'Multiple', 'Divide'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List.empty(growable: true);
  String? _buttonText;

  @override
  void initState() {
    super.initState();

    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }

    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Example')),
      body: Container(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Result : $sum',
                  style: const TextStyle(fontSize: 20)
                )
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(keyboardType: TextInputType.number, controller: value1)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value2,),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.add),
                      const Text('더하기')
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)
                  ),
                  onPressed: () {
                    setState(() {
                      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                      sum = '$result';
                    });
                  }
                )  
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(items: _dropDownMenuItems, onChanged: (String? value) {
                  // First Case -> the state could be change when it outer of the setState
                  /* _buttonText = value;
                  setState(() {
                  }); */

                  // Second Case -> the state in the setState
                  setState(() {
                    _buttonText = value;
                  });
                }, value: _buttonText)
              )
            ],
          ),
        )
      )
    );
  }

}