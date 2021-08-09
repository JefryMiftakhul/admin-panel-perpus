import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/networkapi.dart';
import '/models/Member.dart';
import './editmember.dart';

class Detailsmember extends StatefulWidget {
  final Member member;

  Detailsmember({this.member});

  @override
  _DetailsmemberState createState() => _DetailsmemberState();
}

class _DetailsmemberState extends State<Detailsmember> {
  void deleteMember(context) async {
    /*await http.post(
      "${Env.URL_PREFIX}/delete.php",*/
        await http.post(
          Uri.parse('$DELETESMEMBER'),
      body: {
        'id': widget.member.id.toString(),
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
              onPressed: () => deleteMember(context),
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
              "Name : ${widget.member.name}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Tanggal Lahir : ${widget.member.tanggal_lahir}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Alamat : ${widget.member.alamat}",
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
            builder: (BuildContext context) => Editmember(member: widget.member),
          ),
        ),
      ),
    );
  }
}