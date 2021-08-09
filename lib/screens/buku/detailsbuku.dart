import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import '/models/Buku.dart';
import './editbuku.dart';

class Detailsbuku extends StatefulWidget {
  final Buku buku;

  Detailsbuku({this.buku});

  @override
  _DetailsbukuState createState() => _DetailsbukuState();
}

class _DetailsbukuState extends State<Detailsbuku> {
  void deleteBuku(context) async {
    /*await http.post(
      "${Env.URL_PREFIX}/delete.php",*/
        await http.post(
          Uri.parse('$DELETESBOOK'),
      body: {
        'id': widget.buku.id.toString(),
      },
    );
    // Navigator.pop(context);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Are you sure you want to delete this?'),
          actions: <Widget>[
            RaisedButton(
              child: Icon(Icons.cancel),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Icon(Icons.check_circle),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => deleteBuku(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Judul Buku : ${widget.buku.judul}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Keyword : ${widget.buku.keyword}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Harga : ${widget.buku.harga}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Lokasi : ${widget.buku.lokasi}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Pinjam : ${widget.buku.pinjam}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Tahun Pinjam : ${widget.buku.tahun_terbit}",
              style: TextStyle(fontSize: 20),
            ),

            Padding(
              padding: EdgeInsets.all(10),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Editbuku(buku: widget.buku),
          ),
        ),
      ),
    );
  }
}