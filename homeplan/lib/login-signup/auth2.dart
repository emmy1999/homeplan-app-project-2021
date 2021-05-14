import 'package:homeplan/login-signup/login.dart';
import 'package:homeplan/login-signup/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    if (showSignIn) {
     return SignInPage(toggleView: toggleView);
    } else {
     return SignupPage(toggleView: toggleView);
    }
  }
  

  }

