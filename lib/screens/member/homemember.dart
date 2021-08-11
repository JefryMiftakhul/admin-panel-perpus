import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/networkapi.dart';
import '/models/Member.dart';
import './detailsmember.dart';
import './createmember.dart';

class HomeMember extends StatefulWidget {
  HomeMember({Key key}) : super(key: key);
  @override
  HomeMemberState createState() => HomeMemberState();
}

class HomeMemberState extends State<HomeMember> {
  Future<List<Member>> members;
  final memberListKey = GlobalKey<HomeMemberState>();

  @override
  void initState() {
    super.initState();
    members = getMemberList();
  }

  Future<List<Member>> getMemberList() async {
    final response = await http.get(Uri.parse('$MEMBER'));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    print(items);
    List<Member> members = items.map<Member>((json) {
      return Member.fromJson(json);
    }).toList();

    return members;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: memberListKey,
      appBar: AppBar(
        title: Text('Member List'),
      ),
      body: Center(
        child: FutureBuilder<List<Member>>(
          future: members,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render member lists
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
                        MaterialPageRoute(builder: (context) => Detailsmember(member: data)),
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
            return Createmember();
          }));
        },
      ),
    );
  }
}