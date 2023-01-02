import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileApp extends StatefulWidget {
  const FileApp({super.key});

  @override
  State<FileApp> createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  int _count = 0;
  // ignore: unnecessary_new
  List<String> itemList = new List.empty(growable: true);
  // ignore: unnecessary_new
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    var result = await readListFile();

    setState(() {
      itemList.addAll(result);
    });
  }

  void readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = await File('${dir.path}/count.txt').readAsString();
      print(file);

      setState(() {
        _count = int.parse(file);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void writeCountFile(int count) async {
    var dir = await getApplicationDocumentsDirectory();
    File("${dir.path}/count.txt").writeAsStringSync(count.toString());
  }

  void writeFruit(String fruit) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = await File('${dir.path}/fruit.txt').readAsString();
    file = '$file\n$fruit';
    File("${dir.path}/fruit.txt").writeAsStringSync(file);
  }

  Future<List<String>> readListFile() async {
    // ignore: unnecessary_new
    List<String> itemList = new List.empty(growable: true);
    var key = 'first';

    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? firstCheck = pref.getBool(key);

    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File('${dir.path}/fruit.txt').exists();

    if (firstCheck == null || firstCheck == false || fileExist == false) {
      pref.setBool(key, true);

      // ignore: use_build_context_synchronously
      var file = await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
      File('${dir.path}/fruit.txt').writeAsStringSync(file);

      var array = file.split("\n");
      for (var item in array) {
        print(item);
        itemList.add(item);
      }

      return itemList;
    } else {
      var file = await File('${dir.path}/fruit.txt').readAsString();
      var array = file.split("\n");

      for (var item in array) {
        print(item);
        itemList.add(item);
      }

      return itemList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Example')),
      body: Container(
        child: Center(
          // child: Text(
          //   '$_count',
          //   style: const TextStyle(fontSize: 40),
          // )
          child: Column(
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Text(
                        itemList[index],
                        style: const TextStyle(fontSize: 30)
                      )
                    )
                  );
                },
                itemCount: itemList.length
              )
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          writeFruit(controller.value.text);
          setState(() {
            // _count++;
            itemList.add(controller.value.text);
          });
          // writeCountFile(_count);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
