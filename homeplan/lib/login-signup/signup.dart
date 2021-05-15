
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:homeplan/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage({this.toggleView});
  @override
  _Signupwin createState() => _Signupwin();
}

class _Signupwin extends State<SignupPage> {


  // intialising variables for text field
  String email;
  String password, password2;
  final TextEditingController emailc = TextEditingController();
  final TextEditingController passwordc = TextEditingController();
  final auth = FirebaseAuth.instance; // signing up the user after checking the email and password.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99acdef8),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Signup Window'),
        backgroundColor: Color(0x33acdef8),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(
              child: Form(
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top:0),
                        child: Image.asset(
                          "assets/images/app_icon2.png",
                          width: 100,
                          height: 30,
                        ),
                      ),
                      TextFormField(
                        controller: emailc,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          EmailValidator(
                              errorText: 'enter a valid email address')
                        ]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "enter your Email address",
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: TextFormField(
                          controller: passwordc,
                          validator: MinLengthValidator(6,
                              errorText: "Please enter a valid password"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "enter your Password",
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: TextFormField(
                          validator: MinLengthValidator(6,
                              errorText: "Please enter a valid password"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "verify your Password",
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password2 = val);
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 18.0,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                          

                              if ((email.contains('@')) &&
                                  (password.length > 6)) {
                                print('validated');
                                if (password == password2) {
                                  context
                                      .read<AuthenticationService>()
                                      .signupem(
                                        email: emailc.text.trim(),
                                        password: passwordc.text.trim(),
                                      );
                                } else {
                                  print('password did not match');
                             
                                }
                              } else {
                                print('not validated');
                              }
                            },
                            child: Text("Sign up"),
                            color: Color(0xffea4d1b),
                          )),
                    ],
                  )))),
    );
  }
}
