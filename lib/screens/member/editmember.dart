import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import '/models/Member.dart';
import 'formmember.dart';

class Editmember extends StatefulWidget {
  final Member member;

  Editmember({this.member});

  @override
  _EditmemberState createState() => _EditmemberState();
}

class _EditmemberState extends State<Editmember> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  TextEditingController nameController;
  TextEditingController birthController;
  TextEditingController addressController;

  // Http post request
  Future editMember() async {
    /*return await http.post(
      "${Env.URL_PREFIX}/update.php",*/
    return await http.post(
        Uri.parse('$UPDATESMEMBER'),
      body: {
        "id": widget.member.id.toString(),
        "name": nameController.text,
        "tanggal_lahir": birthController.text,
        "alamat": addressController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await editMember();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.member.name);
    birthController = TextEditingController(text: widget.member.tanggal_lahir);
    addressController = TextEditingController(text: widget.member.alamat);
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