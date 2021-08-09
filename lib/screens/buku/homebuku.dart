import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/networkapi.dart';
import '/models/Buku.dart';
import './detailsbuku.dart';
import './createbuku.dart';

class HomeBuku extends StatefulWidget {
  HomeBuku({Key key}) : super(key: key);
  @override
  HomeBukuState createState() => HomeBukuState();
}

class HomeBukuState extends State<HomeBuku> {
  Future<List<Buku>> bukus;
  final bukuListKey = GlobalKey<HomeBukuState>();

  @override
  void initState() {
    super.initState();
    bukus = getBukuList();
  }

  Future<List<Buku>> getBukuList() async {
    final response = await http.get(Uri.parse('$GETALLSBOOK'));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    print(items);
    List<Buku> bukus = items.map<Buku>((json) {
      return Buku.fromJson(json);
    }).toList();

    return bukus;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: bukuListKey,
      appBar: AppBar(
        title: Text('Buku List'),
      ),
      body: Center(
        child: FutureBuilder<List<Buku>>(
          future: bukus,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render buku lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.judul,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detailsbuku(buku: data)),
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
            return Createbuku();
          }));
        },
      ),
    );
  }
}