import 'package:homeplan/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  _SignupPageState createState() => _SignupPageState();
}

Widget Emailbox() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
            color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.white24, blurRadius: 4, offset: Offset(0, 1))
            ]),
        height: 55,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 12),
              prefixIcon: Icon(Icons.email, color: Color(0xff008080)),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.white38)),
        ),
      )
    ],
  );
}
Widget Passwordbox() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
            color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.white24, blurRadius: 4, offset: Offset(0, 1))
            ]),
        height: 55,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 12),
              prefixIcon: Icon(Icons.lock, color: Color(0xff008080)),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.white38)),
        ),
      )
    ],
  );
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x66008080),
                    Color(0x99008080),
                    Color(0xcc008080),
                    Color(0xff008080),
                  ])),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up Here ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff93ddf9),
                          fontSize: 38),
                    ),
                    SizedBox(height: 50),
                    Emailbox(),
                     SizedBox(height: 25),
                    Passwordbox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
