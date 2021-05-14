import 'package:flutter/material.dart';
import 'package:homeplan/authentication.dart';
import 'package:homeplan/task-bill/screens/task_app.dart';
import 'package:provider/provider.dart';
import 'package:homeplan/nav_bar.dart';
import 'package:homeplan/main.dart';
import 'package:homeplan/login-signup/login.dart';
//import 'package:homeplan/src/screens/home_task.dart';

class Homev extends StatefulWidget {
  static Widget create(BuildContext context) => Homev();

  Home_view createState() => Home_view();
}

class Home_view extends State<Homev> {
  @override
  Widget build(BuildContext context) {
    getName();
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Home Plan'),
          backgroundColor: Color(0x33acdef8),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout'),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                AuthenticationWrapper();
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Image.asset(
                      "assets/images/home_img.png",
                    ),
                  ),
                ]))));
  }
}
