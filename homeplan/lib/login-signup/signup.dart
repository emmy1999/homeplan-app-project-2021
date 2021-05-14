//import 'package:homeplan/login-signup/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:homeplan/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:homeplan/login-signup/email_verify.dart';
//import 'package:homeplan/login-signup/auth.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage({this.toggleView});
  @override
  _Signupwin createState() => _Signupwin();
}

class _Signupwin extends State<SignupPage> {
  // final AuthService _auth = AuthService();

  // intialising variables for text field
  String email;
  String password, password2;
  final TextEditingController emailc = TextEditingController();
  final TextEditingController passwordc = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99394657),
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
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Image.asset(
                          "assets/images/app_icon.png",
                          width: 100,
                          height: 100,
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
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        style: TextStyle(color: Colors.white),
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
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          style: TextStyle(color: Colors.white),
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
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password2 = val);
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 18.0,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                             // print(email);
                              //print(password);
                              //print(password2);

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
                                //  print(password);
                                //  print(password2);
                                }
                              } else {
                                print('not validated');
                              }
                            },
                            child: Text("Sign up"),
                            color: Color(0x99c5af6d),
                          )),
                    ],
                  )))),
    );
  }
}
