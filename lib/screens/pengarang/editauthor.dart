import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import '/models/Pengarang.dart';
import 'formauthor.dart';

class Editauthor extends StatefulWidget {
  final Pengarang pengarang;

  Editauthor({this.pengarang});

  @override
  _EditAuthortState createState() => _EditAuthortState();
}

class _EditAuthortState extends State<Editauthor> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  TextEditingController nameController;
  TextEditingController birthController;

  // Http post request
  Future editPengarang() async {
    /*return await http.post(
      "${Env.URL_PREFIX}/update.php",*/
    return await http.post(
        Uri.parse('$UPDATESAUTHOR'),
      body: {
        "id": widget.pengarang.id.toString(),
        "name": nameController.text,
        "tanggal_lahir": birthController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await editPengarang();
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.pengarang.name);
    birthController = TextEditingController(text: widget.pengarang.tanggal_lahir);
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
            child: AppFormAuthor(
              formKey: formKey,
              nameController: nameController,
              birthController: birthController,
            ),
          ),
        ),
      ),
    );
  }
}