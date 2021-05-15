import 'package:flutter/material.dart';
import 'package:homeplan/home.dart';
import 'package:homeplan/task-bill/screens/task_ms.dart';
import 'package:homeplan/task-bill/screens/settings.dart';
import 'package:homeplan/task-bill/screens/comp_task_ms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeplan/task-bill/screens/bill_share_ms.dart';
import 'package:homeplan/task-bill/screens/bill_paid_ms.dart';
//import 'package:homeplan/bills/bill_app.dart';

String name = "BOB";
// this is the navigation bar of the app.
// this could be used to navigate to different screens.
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getName();
    String email = FirebaseAuth.instance.currentUser.email;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Hello " + name),
            accountEmail: Text(email),
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homev()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outlined),
            title: Text('Task'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Appentry(),
                ),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.add_circle_outline_outlined),
              title: Text('Completed Task'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Comptasks(),
                  ),
                );
              }),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Bill Share'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Billsall(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money_rounded),
            title: Text('Paid Bills'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Billspaid(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              getUser();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profilev(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<void> getName() {
  String uid = FirebaseAuth.instance.currentUser.uid;

  //String lname;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('UserProfile')
      .doc('profile')
      .snapshots()
      .listen((event) {
    name = event.get("fname");
  });
}
