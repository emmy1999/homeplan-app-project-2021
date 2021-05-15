import 'package:flutter/material.dart';
import 'package:homeplan/home.dart';
import 'package:homeplan/login-signup/login.dart';
import 'package:homeplan/login-signup/user.dart';

import 'package:provider/provider.dart';


class wrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    print(firebaseUser);

    //  return either the Home or Authenticate widget
    if (firebaseUser == null) {
      return SignInPage();
    } else {
      return Homev();
    }
  }
}
