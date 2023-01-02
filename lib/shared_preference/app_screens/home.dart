import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/http_kakao_example/app_screens/largefile_main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _setData(int value) async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }
  
  void _loadData() async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    
    setState(() {
      var value = pref.getInt(key);

      if (value == null) {
        _counter = 0;
      } else {
        _counter = value;
      }
    });
  }
  
  void _incrementCounter() {
    setState(() {
      _counter++;
      _setData(_counter);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('You have pushed this button many times: '),
    //         Text('$_counter', style: Theme.of(context).textTheme.displayLarge)
    //       ],
    //     )
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add)
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Logo'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LargeFileMain()));
            },
            child: const Text(
              'Change Logo',
              style: TextStyle(color: Colors.white)
            )
          )
        ],
      ),
      body: Container()
    );
  }
}
