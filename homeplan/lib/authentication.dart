import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeplan/login-signup/login.dart';
import 'package:homeplan/main.dart';
import 'package:homeplan/login-signup/login.dart';

//import 'package:homeplan/models/task_db.dart';
//import 'package:homeplan/login-signup/user.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  /// 
  // this method will sigout the firebase user.
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    AuthenticationWrapper();
    
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  // sign in method.
  Future<String> signinem({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      print("error occur in login 123");
      return e.message;
    }
  }

// signup method 
  Future<String> signupem({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "Signed up";
    } on FirebaseAuthException catch (e) {
       print("error occur in signup 124");
      return e.message;
     
    }
  }
}
