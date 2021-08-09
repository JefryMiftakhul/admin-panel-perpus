import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:admin/screens/genre/home.dart';

import '/networkapi.dart';
import '/models/Genre.dart';
import 'form.dart';

class Edit extends StatefulWidget {
  final Genre genre;

  Edit({this.genre});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  TextEditingController nameController;

  // Http post request
  Future editGenre() async {
    /*return await http.post(
      "${Env.URL_PREFIX}/update.php",*/
    return await http.post(
        Uri.parse('$UPDATES'),
      body: {
        "id": widget.genre.id.toString(),
        "name": nameController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await editGenre();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Home()), (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.genre.name);
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
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
            ),
          ),
        ),
      ),
    );
  }
}