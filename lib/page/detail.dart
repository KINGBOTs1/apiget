import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  String? nama, alamat, tgl_lhr, foto;

  Detail({Key? key, this.nama, this.alamat, this.tgl_lhr, this.foto})
      : super(key: key);
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nama!)),
      body: Column(children: [Image(image: NetworkImage(widget.foto!))]),
    );
  }
}
