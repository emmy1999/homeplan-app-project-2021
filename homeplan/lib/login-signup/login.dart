//import 'package:homeplan/login-signup/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:homeplan/authentication.dart';
import 'package:homeplan/loading-screen/load.dart';
//import 'package:homeplan/login-signup/auth.dart';


class SignInPage extends StatefulWidget {
  static Widget create(BuildContext context) => SignInPage();

  final Function toggleView;
  SignInPage({this.toggleView});
  @override
  _SignInwin createState() => _SignInwin();
}

class _SignInwin extends State<SignInPage> {
  final fkey = GlobalKey<FormState>();
  // intialising variables for text field
// text field state
  String email = '';
  String password = '';
  bool loading = false;
  final TextEditingController emailc = TextEditingController();
  final TextEditingController passwordc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0x99394657),
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Login Window'),
              backgroundColor: Color(0x99384556),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.app_registration),
                  label: Text('Sign Up'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Padding(
                key: fkey,
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
                                padding: EdgeInsets.only(
                                  top: 18.0,
                                ),
                                child: RaisedButton(
                                  onPressed: () {
                                    print(email);
                                    print(password);
                                    print(email.isNotEmpty);
                                    print(password.length);
                                    print(email.contains('@'));
                                    if ((email.contains('@')) &&
                                        (password.length > 6)) {
                                      print('validated');

                                     setState(() => loading = true);
                                      context
                                          .read<AuthenticationService>()
                                          .signinem(
                                            email: emailc.text.trim(),
                                            password: passwordc.text.trim(),
                                          );
                                 
                                    } else {
                                      print('not validated');
                                      setState(() => loading = false);
                                    }
                                  },
                                  child: Text("Sign in"),
                                  color: Color(0x99c5af6d),
                                )),
                          ],
                        )))),
          );
  }
}