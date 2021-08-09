import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/networkapi.dart';
import '/models/Genre.dart';
import './details.dart';
import './create.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Genre>> genres;
  final genreListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    genres = getGenreList();
  }

  Future<List<Genre>> getGenreList() async {
    final response = await http.get(Uri.parse('$GETALLS'));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    print(items);
    List<Genre> genres = items.map<Genre>((json) {
      return Genre.fromJson(json);
    }).toList();

    return genres;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: genreListKey,
      appBar: AppBar(
        title: Text('Genre List'),
      ),
      body: Center(
        child: FutureBuilder<List<Genre>>(
          future: genres,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render genre lists
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
                        MaterialPageRoute(builder: (context) => Details(genre: data)),
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
            return Create();
          }));
        },
      ),
    );
  }
}