import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import '/models/Buku.dart';
import 'formbuku.dart';

class Editbuku extends StatefulWidget {
  final Buku buku;

  Editbuku({this.buku});

  @override
  _EditbukuState createState() => _EditbukuState();
}

class _EditbukuState extends State<Editbuku> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  //TextEditingController nameController;

  TextEditingController judulController;
  TextEditingController keywordController;
  TextEditingController hargaController;
  TextEditingController lokasiController;
  TextEditingController pinjamController;
  TextEditingController thnController;

  // Http post request
  Future editBuku() async {
    /*return await http.post(
      "${Env.URL_PREFIX}/update.php",*/
    return await http.post(
        Uri.parse('$UPDATESBOOK'),
      body: {
        "id": widget.buku.id.toString(),
        "judul": judulController.text,
        "keyword": keywordController.text,
        "harga": hargaController.text,
        "lokasi": lokasiController.text,
        "pinjam": pinjamController.text,
        "tahun_terbit": thnController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await editBuku();
  }

  @override
  void initState() {
    judulController = TextEditingController(text: widget.buku.judul);
    keywordController = TextEditingController(text: widget.buku.keyword);
    hargaController = TextEditingController(text: widget.buku.harga);
    lokasiController = TextEditingController(text: widget.buku.lokasi);
    pinjamController = TextEditingController(text: widget.buku.pinjam);
    thnController = TextEditingController(text: widget.buku.tahun_terbit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text('CONFIRM'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _onConfirm(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppFormBuku(
              formKey: formKey,
              judulController: judulController,
              keywordController: keywordController,
              hargaController: hargaController,
              lokasiController: lokasiController,
              pinjamController: pinjamController,
              thnController: thnController,
            ),
          ),
        ),
      ),
    );
  }
}