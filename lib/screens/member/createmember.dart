import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import 'formmember.dart';

class Createmember extends StatefulWidget {
  final Function refreshMemberList;

  Createmember({this.refreshMemberList});

  @override
  _CreatememberState createState() => _CreatememberState();
}

class _CreatememberState extends State<Createmember> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController = new TextEditingController();
  TextEditingController birthController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  // Http post request to create new data
  Future _createMember() async {
      return await http.post(
        Uri.parse('$MEMBER'),
      body: {
        "name": nameController.text,
        "tanggal_lahir": birthController.text,
        "alamat": addressController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createMember();

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
            child: AppFormMember(
              formKey: formKey,
              nameController: nameController,
              birthController: birthController,
              addressController: addressController,
            ),
          ),
        ),
      ),
    );
  }
}