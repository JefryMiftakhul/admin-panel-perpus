import 'package:flutter/material.dart';

class AppFormBuku extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController judulController;
  TextEditingController keywordController;
  TextEditingController hargaController;
  TextEditingController lokasiController;
  TextEditingController pinjamController;
  TextEditingController thnController;
  //TextEditingController ageController;

  AppFormBuku({this.formKey, this.judulController, this.keywordController, this.hargaController, this.lokasiController, this.pinjamController, this.thnController});

  @override
  _AppFormBukuState createState() => _AppFormBukuState();
}

class _AppFormBukuState extends State<AppFormBuku> {
  String _validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null;
  }

  String _validateNumber(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Age must be a number';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.judulController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Judul'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.keywordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Keyword'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.hargaController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Harga'),
            validator: _validateNumber,
          ),
          TextFormField(
            controller: widget.lokasiController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Lokasi'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.pinjamController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Pinjam'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.thnController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Tahun Terbit'),
            validator: _validateNumber,
          ),
          /*TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            validator: _validateAge,
          ),*/
        ],
      ),
    );;
  }
}