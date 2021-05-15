import 'package:flutter/material.dart';
//import 'package:homeplan/authentication.dart';

//import 'package:provider/provider.dart';
//import 'package:homeplan/home.dart';
import 'package:homeplan/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:homeplan/src/screens/home_task.dart';

class Profilev extends StatefulWidget {
  static Widget create(BuildContext context) => Profilev();

  Profile_view createState() => Profile_view();
}

String fname;
String lname;
// this is the settings screen where a user can add, update first name and last name.
class Profile_view extends State<Profilev> {
  final TextEditingController fnm = TextEditingController();
  final TextEditingController lnm = TextEditingController();

  @override
  void initState() {
    getUser();
    fnm.text = fname;
    lnm.text = lname;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Home Plan'),
          backgroundColor: Color(0x33acdef8),
        ),
        body: Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  // RaisedButton(
                  //   color: Colors.blue,
                  //   child: Text('Load', style: TextStyle(color: Colors.white)),
                  //   onPressed: () {
                  //     getUser();
                  //   },
                  // ),
                  TextField(
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                      onChanged: (String value) => fname = value,
                      controller: fnm),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                    onChanged: (String value) => lname = value,
                    controller: lnm,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      updateUser(fname, lname);
                    },
                  ),
                ]))));
  }
}

Future<void> updateUser(String fnam, String lnam) {
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  return users
      .doc(uid)
      .collection('UserProfile')
      .doc('profile')
      .set({'fname': fnam, 'lname': lnam})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> getUser() {
  String uid = FirebaseAuth.instance.currentUser.uid;

  //String lname;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('UserProfile')
      .doc('profile')
      .snapshots()
      .listen((event) {
    fname = event.get("fname");
    lname = event.get("lname");
  });
}
