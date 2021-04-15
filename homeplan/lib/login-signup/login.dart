import 'package:homeplan/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:homeplan/login-signup/signup.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Window'),
      ),
      body: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(
              child: Form(
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          EmailValidator(
                              errorText: 'enter a valid email address')
                        ]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "enter your Email address",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: TextFormField(
                          validator: MinLengthValidator(6,
                              errorText: "Please enter a valid password"),
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "enter your Password",
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 18.0,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              context.read<AuthenticationService>().signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                            },
                            child: Text("Sign in"),
                            color: Colors.grey,
                          )),
                      RaisedButton(
                        color: Colors.yellow,
                        child: Text("New user Sign up"),
                        textColor: Colors.white,
                      )
                    ],
                  )))),
    );
  }
}
