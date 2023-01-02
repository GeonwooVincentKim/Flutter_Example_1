import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileApp extends StatefulWidget {
  const FileApp({super.key});

  @override
  State<FileApp> createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    readCountFile();
  }

  void readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = await File(dir.path + '/count.txt').readAsString();
      print(file);

      setState(() {
        _count = int.parse(file);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void writeCountFile(int count) async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Example')),
      body: Container(
        child: Center(
          child: Text(
            '$_count',
            style: const TextStyle(fontSize: 40),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
          writeCountFile(_count);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}