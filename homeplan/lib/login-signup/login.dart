import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:homeplan/authentication.dart';
import 'package:homeplan/loading-screen/load.dart';
// this the login screen of the app

class SignInPage extends StatefulWidget {
  static Widget create(BuildContext context) => SignInPage();
// we are calling the function to toggle between screen.
  final Function toggleView;
  SignInPage({this.toggleView});
  @override
  _SignInwin createState() => _SignInwin();
}

//creating state extending the class
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
    return loading // calling the loading screen to show up when the user click on signin button.
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0x99acdef8),
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Login Window'),
              backgroundColor: Color(0x33acdef8),
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
                              padding: EdgeInsets.only(top: 18.0),
                              child: Image.asset(
                                // display the app icon
                                "assets/images/app_icon2.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            TextFormField(
                              controller: emailc,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                                EmailValidator(
                                    // doing the email validation
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
                              //  adding text field to get email and password. to login the user after the validation.
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
                                padding: EdgeInsets.only(
                                  top: 18.0,
                                ),
                                child: RaisedButton(
                                  onPressed: () {       // login button
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
                                          .read<
                                              AuthenticationService>() // calling the firebase auth class to check the email and
                                          .signinem(
                                            // login the user to the app home screen.
                                            email: emailc.text.trim(),
                                            password: passwordc.text.trim(),
                                          );
                                    } else {
                                      print('not validated');
                                      setState(() => loading =
                                          false); // calling the loading widget.
                                    }
                                  },
                                  child: Text("Sign in"),
                                  color: Colors.blue,
                                )),
                          ],
                        )))),
          );
  }
}
