import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


// this is the loading widget.
// this is called when a user is loginin or signup.
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: SpinKitCircle(
          color: Colors.amber,
          size: 50.0,
        ),
      ),
    );
  }
}
