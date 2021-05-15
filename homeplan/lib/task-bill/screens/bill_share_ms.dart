import 'package:flutter/material.dart';

import 'package:homeplan/task-bill/providers/bills_provider.dart';
import 'package:homeplan/task-bill/screens/bill_share_all.dart';
import 'package:provider/provider.dart';
// this widget is used to call the paid bill share screen.
class Billsall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BillProvider(),
      child: MaterialApp(
          home: Bill_view(),
          theme: ThemeData(
            
 
          )),
    );
  }
}
