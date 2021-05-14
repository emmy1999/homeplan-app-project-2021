import 'package:flutter/material.dart';

import 'package:homeplan/task-bill/providers/bills_provider.dart';
import 'package:homeplan/task-bill/screens/bill_paid.dart';
import 'package:provider/provider.dart';

class Billspaid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => BillProvider(),
      child: MaterialApp(
          home: Bill_paid(),
          theme: ThemeData(
            
 
          )),
    );
  }
}
