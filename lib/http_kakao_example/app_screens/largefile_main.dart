import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  const LargeFileMain({super.key});

  @override
  State<LargeFileMain> createState() => _LargeFileMainState();
}

class _LargeFileMainState extends State<LargeFileMain> {
  final imgUrl = 
    'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg'
    '?auto=compress';

  TextEditingController? _editingController;
  bool downloading = false;
  var progressString = "";
  String file = "";

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_new
    _editingController = new TextEditingController(
      text: 'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg?auto=compress'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'Type URL'),
        )
      ),
      body: Center(
        child: downloading
          ? Container(
            height: 120.0,
            width: 200.0,
            child: Card(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20.0),
                  Text(
                    'Downloading File : $progressString',
                    style: const TextStyle(color: Colors.white)
                  )
                ]
              )
            )
          ) : FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  print('None');
                  return Text("No Data");
                case ConnectionState.waiting:
                  print('Waiting');
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  print('Active');
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  print('Done');
                  
                  if (snapshot.hasData) {
                    return snapshot.data as Widget;
                  }
              }

              print('End Process');
              return Text('No Data');
            },

            future: downloadWidget(file),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(_editingController!.value.text, '${dir.path}/myimage.jpg',
        onReceiveProgress: (rec, total) {
          print('Rec: $rec, Total: $total');
          
          file = '${dir.path}/myimage.jpg';
          setState(() {
            downloading = true;
            progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
          });
        }
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = 'Completed';
    });

    print('Download completed');
  }

  Future<Widget> downloadWidget(String filePath) async {
    File file = File(filePath);
    bool exist = await file.exists();
    new FileImage(file).evict();

    if (exist) {
      return Center(
        child: Column(
          children: [
            Image.file(File(filePath))
          ],
        )
      );
    } else return Text('No Data');
  }
}
