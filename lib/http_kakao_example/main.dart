import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({super.key});

  @override
  State<HttpApp> createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http Example')),
      body: Container(
        child: Center(
          child: Text('$result')
        )
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () async {
        //   var url = 'http://www.google.com';
        //   var response = await http.get(Uri.parse(url));
          
        //   setState(() {
        //     result = response.body;
        //   });
        // },
        onPressed: () async {
          getJSONData();
        },
        child: const Icon(Icons.file_download)
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "KakaoAK 4ef0066672e401dbdd94650e01ef9879"
      }
    );

    print(response.body);
    return "Successfull";
  }
}
