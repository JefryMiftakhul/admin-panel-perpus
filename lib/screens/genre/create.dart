import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import 'form.dart';

class Create extends StatefulWidget {
  final Function refreshGenreList;

  Create({this.refreshGenreList});

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController = new TextEditingController();
  //TextEditingController ageController = new TextEditingController();

  // Http post request to create new data
  Future _createGenre() async {
    //await http.get(Uri.parse('$HAPUS_CATATAN?id=$id'));
    /*return await http.post(
      "${Env.URL_PREFIX}/create.php",*/
      return await http.post(
        Uri.parse('$ADDS'),
      body: {
        "name": nameController.text,
        //"age": ageController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createGenre();

    // Remove all existing routes until the Home.dart, then rebuild Home.
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
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
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              //ageController: ageController,
            ),
          ),
        ),
      ),
    );
  }
}