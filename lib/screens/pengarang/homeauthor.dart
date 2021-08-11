import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/networkapi.dart';
import '/models/Pengarang.dart';
import './detailsauthor.dart';
import './createauthor.dart';

class HomeAuthor extends StatefulWidget {
  HomeAuthor({Key key}) : super(key: key);
  @override
  HomeAuthorState createState() => HomeAuthorState();
}

class HomeAuthorState extends State<HomeAuthor> {
  Future<List<Pengarang>> pengarangs;
  final pengarangListKey = GlobalKey<HomeAuthorState>();

  @override
  void initState() {
    super.initState();
    pengarangs = getPengarangList();
  }

  Future<List<Pengarang>> getPengarangList() async {
    final response = await http.get(Uri.parse('$AUTHOR'));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    print(items);
    List<Pengarang> pengarangs = items.map<Pengarang>((json) {
      return Pengarang.fromJson(json);
    }).toList();

    return pengarangs;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pengarangListKey,
      appBar: AppBar(
        title: Text('Pengarang List'),
      ),
      body: Center(
        child: FutureBuilder<List<Pengarang>>(
          future: pengarangs,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render author lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detailsauthor(pengarang: data)),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Createauthor();
          }));
        },
      ),
    );
  }
}