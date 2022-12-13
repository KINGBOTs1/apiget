import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:apiget/Api/constan_api.dart';

import 'page/detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<dynamic>> _fetchData() async {
    var result = await http.get(Uri.parse(BaseUrl.Api!));
    final res = json.decode(result.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data API'),
      ),
      body: FutureBuilder<List<dynamic>>(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(snapshot.data![index]['nama']),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                        nama: snapshot.data![index]['nama'],
                                        alamat: snapshot.data![index]['alamat'],
                                        tgl_lhr: snapshot.data![index]
                                            ['tgl_lhr'],
                                        foto: snapshot.data![index]['foto'],
                                      )));
                        },
                        child: Image(
                          image: NetworkImage(snapshot.data![index]['foto']),
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
