import 'package:flutter/material.dart';

class AppFormAuthor extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController;
  TextEditingController birthController;

  AppFormAuthor({this.formKey, this.nameController, this.birthController});

  @override
  _AppFormAuthorState createState() => _AppFormAuthorState();
}

class _AppFormAuthorState extends State<AppFormAuthor> {
  String _validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null;
  }

  String _validateBirth(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null;
  }

/*
  String _validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Age must be a number';
    return null;
  }*/

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.birthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Tgl Lahir'),
            validator: _validateBirth,
          ),
        ],
      ),
    );;
  }
}