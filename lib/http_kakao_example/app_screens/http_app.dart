import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApp extends StatefulWidget {
  const HttpApp({super.key});

  @override
  State<HttpApp> createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';
  List? data;
  TextEditingController? _editingController;
  ScrollController? _scrollController;
  int page = 1;

  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
    _editingController = new TextEditingController();
    _scrollController = new ScrollController();

    _scrollController!.addListener(() {
      if (_scrollController!.offset >= _scrollController!.position.maxScrollExtent
      && !_scrollController!.position.outOfRange) {
        print('bottom');
        page++;

        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'Type Search word'),
        )
      ),
      body: Center(
        child: data!.isEmpty
          ? const Text(
            'No Data',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ) : 
          ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      data![index]['thumbnail'],
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "image/chapter_07/book-clipart.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain
                        );
                      },
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                            data![index]['title'].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text('Author : ${data![index]['authors'].toString()}'),
                        Text('Price : ${data![index]['sale_price'].toString()}'),
                        Text('Sell Status : ${data![index]['status'].toString()}'),
                      ],
                    )
                  ],
                )
              );
            },
            itemCount: data!.length,
            controller: _scrollController,
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
        onPressed: () {
          page = 1;
          data!.clear();
          getJSONData();
        },
        child: const Icon(Icons.file_download)
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController!.value.text}';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "KakaoAK 4ef0066672e401dbdd94650e01ef9879"
      }
    );

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });

    return response.body;
  }
}
