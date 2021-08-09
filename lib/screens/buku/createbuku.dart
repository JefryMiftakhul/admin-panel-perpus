import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import 'formbuku.dart';

class Createbuku extends StatefulWidget {
  final Function refreshBukuList;

  Createbuku({this.refreshBukuList});

  @override
  _CreatebukuState createState() => _CreatebukuState();
}

class _CreatebukuState extends State<Createbuku> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController judulController = new TextEditingController();
  TextEditingController keywordController = new TextEditingController();
  TextEditingController hargaController = new TextEditingController();
  TextEditingController lokasiController = new TextEditingController();
  TextEditingController pinjamController = new TextEditingController();
  TextEditingController thnController = new TextEditingController();
  //TextEditingController ageController = new TextEditingController();

  // Http post request to create new data
  Future _createBuku() async {
    //await http.get(Uri.parse('$HAPUS_CATATAN?id=$id'));
    /*return await http.post(
      "${Env.URL_PREFIX}/create.php",*/
      return await http.post(
        Uri.parse('$ADDSBOOK'),
      body: {
        "judul": judulController.text,
        "keyword": keywordController.text,
        "harga": hargaController.text,
        "lokasi": lokasiController.text,
        "pinjam": pinjamController.text,
        "tahun_terbit": thnController.text,
        //"age": ageController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createBuku();

    // Remove all existing routes until the Home.dart, then rebuild Home.
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Book"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text("CONFIRM"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            if (formKey.currentState.validate()) {
              _onConfirm(context);
            }
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

              //ageController: ageController,
            ),
          ),
        ),
      ),
    );
  }
}