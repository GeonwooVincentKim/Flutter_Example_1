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

  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Http Example')),
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
                      fit: BoxFit.contain
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

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });

    return response.body;
  }
}
