import 'package:admin/screens/buku/homebuku.dart';
import 'package:admin/screens/genre/home.dart';
import 'package:admin/screens/loginpage.dart';
import 'package:admin/screens/member/homemember.dart';
import 'package:admin/screens/pengarang/homeauthor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('value');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logov2.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Data Buku",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeBuku();
              }));
            },
          ),
          DrawerListTile(
            title: "Data Genre",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Home();
              }));
            },
          ),
          DrawerListTile(
            title: "Data Pengarang",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeAuthor();
              }));
            },
          ),
          DrawerListTile(
            title: "Data Member",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeMember();
              }));
            },
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              remove();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
              /*Navigator.push(context, MaterialPageRoute(builder: (_) {
                return LoginPage();
              }));*/
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
